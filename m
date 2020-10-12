Content-Type: multipart/mixed; boundary="===============1086109528200798207=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] [PATCH v5]jbd2: avoid transaction reuse after reformatting
Date: Tue, 13 Oct 2020 02:10:12 +0800
Message-ID: <202010130235.6d5bx1v4-lkp@intel.com>
In-Reply-To: <20201012134322.5956-1-changfengnan@hikvision.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1086109528200798207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengnan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-fscrypt/master]
[cannot apply to ext4/dev linus/master v5.9 next-20201012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Fengnan-Chang/jbd2-avoid-t=
ransaction-reuse-after-reformatting/20201012-215959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/fscrypt.git m=
aster
config: sparc64-randconfig-s032-20201012 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-rc1-dirty
        # https://github.com/0day-ci/linux/commit/fa9e125afb86200f923868b05=
7a3e77ec7dcb215
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Fengnan-Chang/jbd2-avoid-transacti=
on-reuse-after-reformatting/20201012-215959
        git checkout fa9e125afb86200f923868b057a3e77ec7dcb215
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsparc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> fs/jbd2/recovery.c:708:45: sparse: sparse: incorrect type in assignment =
(different base types) @@     expected restricted __be64 [usertype] commit_=
time @@     got unsigned long long [usertype] @@
   fs/jbd2/recovery.c:708:45: sparse:     expected restricted __be64 [usert=
ype] commit_time
   fs/jbd2/recovery.c:708:45: sparse:     got unsigned long long [usertype]
   fs/jbd2/recovery.c:717:45: sparse: sparse: restricted __be64 degrades to=
 integer
   fs/jbd2/recovery.c:718:49: sparse: sparse: restricted __be64 degrades to=
 integer
   fs/jbd2/recovery.c:781:45: sparse: sparse: restricted __be64 degrades to=
 integer
   fs/jbd2/recovery.c:782:49: sparse: sparse: restricted __be64 degrades to=
 integer
   fs/jbd2/recovery.c:802:37: sparse: sparse: restricted __be64 degrades to=
 integer
   fs/jbd2/recovery.c:802:51: sparse: sparse: restricted __be64 degrades to=
 integer

vim +708 fs/jbd2/recovery.c

   415	=

   416	static int do_one_pass(journal_t *journal,
   417				struct recovery_info *info, enum passtype pass)
   418	{
   419		unsigned int		first_commit_ID, next_commit_ID;
   420		unsigned long		next_log_block;
   421		int			err, success =3D 0;
   422		journal_superblock_t *	sb;
   423		journal_header_t *	tmp;
   424		struct buffer_head *	bh;
   425		unsigned int		sequence;
   426		int			blocktype;
   427		int			tag_bytes =3D journal_tag_bytes(journal);
   428		__u32			crc32_sum =3D ~0; /* Transactional Checksums */
   429		int			descr_csum_size =3D 0;
   430		int			block_error =3D 0;
   431		bool		need_check_commit_time =3D false;
   432		__be64		last_trans_commit_time =3D 0, commit_time =3D 0;
   433	=

   434		/*
   435		 * First thing is to establish what we expect to find in the log
   436		 * (in terms of transaction IDs), and where (in terms of log
   437		 * block offsets): query the superblock.
   438		 */
   439	=

   440		sb =3D journal->j_superblock;
   441		next_commit_ID =3D be32_to_cpu(sb->s_sequence);
   442		next_log_block =3D be32_to_cpu(sb->s_start);
   443	=

   444		first_commit_ID =3D next_commit_ID;
   445		if (pass =3D=3D PASS_SCAN)
   446			info->start_transaction =3D first_commit_ID;
   447	=

   448		jbd_debug(1, "Starting recovery pass %d\n", pass);
   449	=

   450		/*
   451		 * Now we walk through the log, transaction by transaction,
   452		 * making sure that each transaction has a commit block in the
   453		 * expected place.  Each complete transaction gets replayed back
   454		 * into the main filesystem.
   455		 */
   456	=

   457		while (1) {
   458			int			flags;
   459			char *			tagp;
   460			journal_block_tag_t *	tag;
   461			struct buffer_head *	obh;
   462			struct buffer_head *	nbh;
   463	=

   464			cond_resched();
   465	=

   466			/* If we already know where to stop the log traversal,
   467			 * check right now that we haven't gone past the end of
   468			 * the log. */
   469	=

   470			if (pass !=3D PASS_SCAN)
   471				if (tid_geq(next_commit_ID, info->end_transaction))
   472					break;
   473	=

   474			jbd_debug(2, "Scanning for sequence ID %u at %lu/%lu\n",
   475				  next_commit_ID, next_log_block, journal->j_last);
   476	=

   477			/* Skip over each chunk of the transaction looking
   478			 * either the next descriptor block or the final commit
   479			 * record. */
   480	=

   481			jbd_debug(3, "JBD2: checking block %ld\n", next_log_block);
   482			err =3D jread(&bh, journal, next_log_block);
   483			if (err)
   484				goto failed;
   485	=

   486			next_log_block++;
   487			wrap(journal, next_log_block);
   488	=

   489			/* What kind of buffer is it?
   490			 *
   491			 * If it is a descriptor block, check that it has the
   492			 * expected sequence number.  Otherwise, we're all done
   493			 * here. */
   494	=

   495			tmp =3D (journal_header_t *)bh->b_data;
   496	=

   497			if (tmp->h_magic !=3D cpu_to_be32(JBD2_MAGIC_NUMBER)) {
   498				brelse(bh);
   499				break;
   500			}
   501	=

   502			blocktype =3D be32_to_cpu(tmp->h_blocktype);
   503			sequence =3D be32_to_cpu(tmp->h_sequence);
   504			jbd_debug(3, "Found magic %d, sequence %d\n",
   505				  blocktype, sequence);
   506	=

   507			if (sequence !=3D next_commit_ID) {
   508				brelse(bh);
   509				break;
   510			}
   511	=

   512			/* OK, we have a valid descriptor block which matches
   513			 * all of the sequence number checks.  What are we going
   514			 * to do with it?  That depends on the pass... */
   515	=

   516			switch(blocktype) {
   517			case JBD2_DESCRIPTOR_BLOCK:
   518				/* Verify checksum first */
   519				if (jbd2_journal_has_csum_v2or3(journal))
   520					descr_csum_size =3D
   521						sizeof(struct jbd2_journal_block_tail);
   522				if (descr_csum_size > 0 &&
   523				    !jbd2_descriptor_block_csum_verify(journal,
   524								       bh->b_data)) {
   525					/*
   526					 * PASS_SCAN can see stale blocks due to lazy
   527					 * journal init. Don't error out on those yet.
   528					 */
   529					if (pass !=3D PASS_SCAN) {
   530						pr_err("JBD2: Invalid checksum recovering block %lu in log\n",
   531						       next_log_block);
   532						err =3D -EFSBADCRC;
   533						brelse(bh);
   534						goto failed;
   535					}
   536					need_check_commit_time =3D true;
   537					jbd_debug(1,
   538						"invalid descriptor block found in %lu\n",
   539						next_log_block);
   540				}
   541	=

   542				/* If it is a valid descriptor block, replay it
   543				 * in pass REPLAY; if journal_checksums enabled, then
   544				 * calculate checksums in PASS_SCAN, otherwise,
   545				 * just skip over the blocks it describes. */
   546				if (pass !=3D PASS_REPLAY) {
   547					if (pass =3D=3D PASS_SCAN &&
   548					    jbd2_has_feature_checksum(journal) &&
   549					    !need_check_commit_time &&
   550					    !info->end_transaction) {
   551						if (calc_chksums(journal, bh,
   552								&next_log_block,
   553								&crc32_sum)) {
   554							put_bh(bh);
   555							break;
   556						}
   557						put_bh(bh);
   558						continue;
   559					}
   560					next_log_block +=3D count_tags(journal, bh);
   561					wrap(journal, next_log_block);
   562					put_bh(bh);
   563					continue;
   564				}
   565	=

   566				/* A descriptor block: we can now write all of
   567				 * the data blocks.  Yay, useful work is finally
   568				 * getting done here! */
   569	=

   570				tagp =3D &bh->b_data[sizeof(journal_header_t)];
   571				while ((tagp - bh->b_data + tag_bytes)
   572				       <=3D journal->j_blocksize - descr_csum_size) {
   573					unsigned long io_block;
   574	=

   575					tag =3D (journal_block_tag_t *) tagp;
   576					flags =3D be16_to_cpu(tag->t_flags);
   577	=

   578					io_block =3D next_log_block++;
   579					wrap(journal, next_log_block);
   580					err =3D jread(&obh, journal, io_block);
   581					if (err) {
   582						/* Recover what we can, but
   583						 * report failure at the end. */
   584						success =3D err;
   585						printk(KERN_ERR
   586							"JBD2: IO error %d recovering "
   587							"block %ld in log\n",
   588							err, io_block);
   589					} else {
   590						unsigned long long blocknr;
   591	=

   592						J_ASSERT(obh !=3D NULL);
   593						blocknr =3D read_tag_block(journal,
   594									 tag);
   595	=

   596						/* If the block has been
   597						 * revoked, then we're all done
   598						 * here. */
   599						if (jbd2_journal_test_revoke
   600						    (journal, blocknr,
   601						     next_commit_ID)) {
   602							brelse(obh);
   603							++info->nr_revoke_hits;
   604							goto skip_write;
   605						}
   606	=

   607						/* Look for block corruption */
   608						if (!jbd2_block_tag_csum_verify(
   609							journal, tag, obh->b_data,
   610							be32_to_cpu(tmp->h_sequence))) {
   611							brelse(obh);
   612							success =3D -EFSBADCRC;
   613							printk(KERN_ERR "JBD2: Invalid "
   614							       "checksum recovering "
   615							       "data block %llu in "
   616							       "log\n", blocknr);
   617							block_error =3D 1;
   618							goto skip_write;
   619						}
   620	=

   621						/* Find a buffer for the new
   622						 * data being restored */
   623						nbh =3D __getblk(journal->j_fs_dev,
   624								blocknr,
   625								journal->j_blocksize);
   626						if (nbh =3D=3D NULL) {
   627							printk(KERN_ERR
   628							       "JBD2: Out of memory "
   629							       "during recovery.\n");
   630							err =3D -ENOMEM;
   631							brelse(bh);
   632							brelse(obh);
   633							goto failed;
   634						}
   635	=

   636						lock_buffer(nbh);
   637						memcpy(nbh->b_data, obh->b_data,
   638								journal->j_blocksize);
   639						if (flags & JBD2_FLAG_ESCAPE) {
   640							*((__be32 *)nbh->b_data) =3D
   641							cpu_to_be32(JBD2_MAGIC_NUMBER);
   642						}
   643	=

   644						BUFFER_TRACE(nbh, "marking dirty");
   645						set_buffer_uptodate(nbh);
   646						mark_buffer_dirty(nbh);
   647						BUFFER_TRACE(nbh, "marking uptodate");
   648						++info->nr_replays;
   649						/* ll_rw_block(WRITE, 1, &nbh); */
   650						unlock_buffer(nbh);
   651						brelse(obh);
   652						brelse(nbh);
   653					}
   654	=

   655				skip_write:
   656					tagp +=3D tag_bytes;
   657					if (!(flags & JBD2_FLAG_SAME_UUID))
   658						tagp +=3D 16;
   659	=

   660					if (flags & JBD2_FLAG_LAST_TAG)
   661						break;
   662				}
   663	=

   664				brelse(bh);
   665				continue;
   666	=

   667			case JBD2_COMMIT_BLOCK:
   668				/*     How to differentiate between interrupted commit
   669				 *               and journal corruption ?
   670				 *
   671				 * {nth transaction}
   672				 *        Checksum Verification Failed
   673				 *			 |
   674				 *		 ____________________
   675				 *		|		     |
   676				 * 	async_commit             sync_commit
   677				 *     		|                    |
   678				 *		| GO TO NEXT    "Journal Corruption"
   679				 *		| TRANSACTION
   680				 *		|
   681				 * {(n+1)th transanction}
   682				 *		|
   683				 * 	 _______|______________
   684				 * 	|	 	      |
   685				 * Commit block found	Commit block not found
   686				 *      |		      |
   687				 * "Journal Corruption"       |
   688				 *		 _____________|_________
   689				 *     		|	           	|
   690				 *	nth trans corrupt	OR   nth trans
   691				 *	and (n+1)th interrupted     interrupted
   692				 *	before commit block
   693				 *      could reach the disk.
   694				 *	(Cannot find the difference in above
   695				 *	 mentioned conditions. Hence assume
   696				 *	 "Interrupted Commit".)
   697				 */
   698				/*
   699				 * If need_check_commit_time is set, it means
   700				 * csum verify failed before, if commit_time is
   701				 * increasing, it's same journal, otherwise it
   702				 * is stale journal block, just end this
   703				 * recovery.
   704				 */
   705				if (pass =3D=3D PASS_SCAN) {
   706					struct commit_header *cbh =3D
   707						(struct commit_header *)bh->b_data;
 > 708					commit_time =3D
   709						be64_to_cpu(cbh->h_commit_sec);
   710					/*
   711					 * When need check commit time, it means csum
   712					 * verify failed before, if commit time is
   713					 * increasing, it's same journal, otherwise
   714					 * not same journal, just end this recovery.
   715					 */
   716					if (need_check_commit_time) {
   717						if (commit_time >=3D
   718							last_trans_commit_time) {
   719							pr_err("JBD2: Invalid checksum found in transaction %u\n",
   720									next_commit_ID);
   721							err =3D -EFSBADCRC;
   722							brelse(bh);
   723							goto failed;
   724						}
   725						/*
   726						 * It likely does not belong to same
   727						 * journal, just end this recovery with
   728						 * success.
   729						 */
   730						jbd_debug(1, "JBD2: Invalid checksum ignored in transaction %u,=
 likely stale data\n",
   731								next_commit_ID);
   732						err =3D 0;
   733						brelse(bh);
   734						goto done;
   735					}
   736				}
   737				/* Found an expected commit block: if checksums
   738				 * are present verify them in PASS_SCAN; else not
   739				 * much to do other than move on to the next sequence
   740				 * number.
   741				 */
   742				if (pass =3D=3D PASS_SCAN &&
   743				    jbd2_has_feature_checksum(journal)) {
   744					int chksum_err, chksum_seen;
   745					struct commit_header *cbh =3D
   746						(struct commit_header *)bh->b_data;
   747					unsigned found_chksum =3D
   748						be32_to_cpu(cbh->h_chksum[0]);
   749	=

   750					chksum_err =3D chksum_seen =3D 0;
   751	=

   752					if (info->end_transaction) {
   753						journal->j_failed_commit =3D
   754							info->end_transaction;
   755						brelse(bh);
   756						break;
   757					}
   758	=

   759					if (crc32_sum =3D=3D found_chksum &&
   760					    cbh->h_chksum_type =3D=3D JBD2_CRC32_CHKSUM &&
   761					    cbh->h_chksum_size =3D=3D
   762							JBD2_CRC32_CHKSUM_SIZE)
   763					       chksum_seen =3D 1;
   764					else if (!(cbh->h_chksum_type =3D=3D 0 &&
   765						     cbh->h_chksum_size =3D=3D 0 &&
   766						     found_chksum =3D=3D 0 &&
   767						     !chksum_seen))
   768					/*
   769					 * If fs is mounted using an old kernel and then
   770					 * kernel with journal_chksum is used then we
   771					 * get a situation where the journal flag has
   772					 * checksum flag set but checksums are not
   773					 * present i.e chksum =3D 0, in the individual
   774					 * commit blocks.
   775					 * Hence to avoid checksum failures, in this
   776					 * situation, this extra check is added.
   777					 */
   778							chksum_err =3D 1;
   779	=

   780					if (chksum_err) {
   781						if (commit_time <
   782							last_trans_commit_time) {
   783							jbd_debug(1, "JBD2: Invalid commit checksum ignored in transac=
tion %u, likely stale data\n",
   784								next_log_block);
   785							brelse(bh);
   786							goto done;
   787						}
   788						info->end_transaction =3D next_commit_ID;
   789	=

   790						if (!jbd2_has_feature_async_commit(journal)) {
   791							journal->j_failed_commit =3D
   792								next_commit_ID;
   793							brelse(bh);
   794							break;
   795						}
   796					}
   797					crc32_sum =3D ~0;
   798				}
   799				if (pass =3D=3D PASS_SCAN &&
   800				    !jbd2_commit_block_csum_verify(journal,
   801								   bh->b_data)) {
   802					if (commit_time < last_trans_commit_time) {
   803						jbd_debug(1, "JBD2: Invalid commit checksum ignored in transact=
ion %u, likely stale data\n",
   804							next_log_block);
   805						brelse(bh);
   806						goto done;
   807					}
   808					info->end_transaction =3D next_commit_ID;
   809	=

   810					if (!jbd2_has_feature_async_commit(journal)) {
   811						journal->j_failed_commit =3D
   812							next_commit_ID;
   813						brelse(bh);
   814						break;
   815					}
   816				}
   817				if (pass =3D=3D PASS_SCAN)
   818					last_trans_commit_time =3D commit_time;
   819				brelse(bh);
   820				next_commit_ID++;
   821				continue;
   822	=

   823			case JBD2_REVOKE_BLOCK:
   824				/*
   825				 * Check revoke block crc in pass_scan, if csum verify
   826				 * failed, check commit block time later.
   827				 */
   828				if (pass =3D=3D PASS_SCAN) {
   829					if (!jbd2_descriptor_block_csum_verify(journal,
   830							bh->b_data)) {
   831						jbd_debug(1, "invalid revoke block found in %lu\n",
   832							next_log_block);
   833						need_check_commit_time =3D true;
   834					}
   835				}
   836				/* If we aren't in the REVOKE pass, then we can
   837				 * just skip over this block. */
   838				if (pass !=3D PASS_REVOKE) {
   839					brelse(bh);
   840					continue;
   841				}
   842	=

   843				err =3D scan_revoke_records(journal, bh,
   844							  next_commit_ID, info);
   845				brelse(bh);
   846				if (err)
   847					goto failed;
   848				continue;
   849	=

   850			default:
   851				jbd_debug(3, "Unrecognised magic %d, end of scan.\n",
   852					  blocktype);
   853				brelse(bh);
   854				goto done;
   855			}
   856		}
   857	=

   858	 done:
   859		/*
   860		 * We broke out of the log scan loop: either we came to the
   861		 * known end of the log or we found an unexpected block in the
   862		 * log.  If the latter happened, then we know that the "current"
   863		 * transaction marks the end of the valid log.
   864		 */
   865	=

   866		if (pass =3D=3D PASS_SCAN) {
   867			if (!info->end_transaction)
   868				info->end_transaction =3D next_commit_ID;
   869		} else {
   870			/* It's really bad news if different passes end up at
   871			 * different places (but possible due to IO errors). */
   872			if (info->end_transaction !=3D next_commit_ID) {
   873				printk(KERN_ERR "JBD2: recovery pass %d ended at "
   874					"transaction %u, expected %u\n",
   875					pass, next_commit_ID, info->end_transaction);
   876				if (!success)
   877					success =3D -EIO;
   878			}
   879		}
   880		if (block_error && success =3D=3D 0)
   881			success =3D -EIO;
   882		return success;
   883	=

   884	 failed:
   885		return err;
   886	}
   887	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1086109528200798207==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1086109528200798207==--

