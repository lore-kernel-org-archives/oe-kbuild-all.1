Content-Type: multipart/mixed; boundary="===============4149455094333645638=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [kbuild] [jlayton:ceph-fscache-iter 76/77] fs/ceph/addr.c:225 ceph_fsreq_issue_op() error: uninitialized symbol 'err'.
Date: Sat, 30 May 2020 16:49:40 -0400
Message-ID: <5e1172d332f55803039114c4bb9a93361bcbc29a.camel@kernel.org>
In-Reply-To: <20200530204435.GR22511@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4149455094333645638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-05-30 at 23:44 +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git=
 ceph-fscache-iter
> head:   ce11bedb85675dee88f70d28fc09cb5bca59c73e
> commit: abd9e1c4c6c6d86ef46c1782a886b52f09d87ebb [76/77] ceph: convert wr=
itepage over to new helper
> config: x86_64-randconfig-m001-20200529 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> fs/ceph/addr.c:225 ceph_fsreq_issue_op() error: uninitialized symbol 'err=
'.
> fs/ceph/addr.c:1356 writeback_older_snapc() error: potentially dereferenc=
ing uninitialized 'oldest'.
> =

> Old smatch warnings:
> fs/ceph/addr.c:432 start_read() warn: should 'nr_pages << 12' be a 64 bit=
 type?
> fs/ceph/addr.c:468 start_read() warn: should 'nr_pages << 12' be a 64 bit=
 type?
> fs/ceph/addr.c:2044 __ceph_pool_perm_get() error: we previously assumed '=
pool_ns' could be null (see line 2033)
> include/linux/ceph/string_table.h:46 ceph_compare_string() error: we prev=
iously assumed 'cs' could be null (see line 41)
> =

> # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commi=
t/?id=3Dabd9e1c4c6c6d86ef46c1782a886b52f09d87ebb
> git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jl=
ayton/linux.git
> git remote update jlayton
> git checkout abd9e1c4c6c6d86ef46c1782a886b52f09d87ebb
> vim +/err +225 fs/ceph/addr.c
> =

> e4de9a35b08dcf Jeff Layton 2020-05-21  188  static void ceph_fsreq_issue_=
op(struct fscache_io_request *fsreq)
> e4de9a35b08dcf Jeff Layton 2020-05-21  189  {
> e4de9a35b08dcf Jeff Layton 2020-05-21  190  	struct ceph_fsc_request *cfr=
eq =3D container_of(fsreq,
> e4de9a35b08dcf Jeff Layton 2020-05-21  191  						      struct ceph_fsc_r=
equest,
> e4de9a35b08dcf Jeff Layton 2020-05-21  192  						      fsc_req);
> e4de9a35b08dcf Jeff Layton 2020-05-21  193  	struct ceph_osd_request *req=
 =3D &cfreq->osd_req;
> e4de9a35b08dcf Jeff Layton 2020-05-21  194  	struct ceph_fs_client *fsc =
=3D req->r_priv;
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  195  	struct ceph_inode_info *ci =
=3D ceph_inode(fsreq->mapping->host);
> e4de9a35b08dcf Jeff Layton 2020-05-21  196  	int err;
> e4de9a35b08dcf Jeff Layton 2020-05-21  197  =

> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  198  	if (ci->i_inline_version !=
=3D CEPH_INLINE_NONE) {
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  199  		/*
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  200  		 * Uptodate inline data sho=
uld have been added
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  201  		 * into page cache while ge=
tting Fcr caps.
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  202  		 */
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  203  		if (fsreq->pos =3D=3D 0)
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  204  			err =3D -EINVAL;
> =

> err not set if ->pos !=3D 0
> =

> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  205  		goto out;
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  206  	}
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  207  =

> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  208  	/* FIXME: in read-for-write =
case, don't issue a read if the write will
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  209  	 * 	  cover the whole page.
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  210  	 */
> e4de9a35b08dcf Jeff Layton 2020-05-21  211  	err =3D ceph_osdc_start_requ=
est(req->r_osdc, req, false);
> e4de9a35b08dcf Jeff Layton 2020-05-21  212  	if (!err)
> e4de9a35b08dcf Jeff Layton 2020-05-21  213  		err =3D ceph_osdc_wait_requ=
est(req->r_osdc, req);
> e4de9a35b08dcf Jeff Layton 2020-05-21  214  =

> e4de9a35b08dcf Jeff Layton 2020-05-21  215  	ceph_update_read_latency(&fs=
c->mdsc->metric, req->r_start_latency,
> e4de9a35b08dcf Jeff Layton 2020-05-21  216  				 req->r_end_latency, err);
> e4de9a35b08dcf Jeff Layton 2020-05-21  217  =

> e4de9a35b08dcf Jeff Layton 2020-05-21  218  	/* no object means success b=
ut no data */
> e4de9a35b08dcf Jeff Layton 2020-05-21  219  	if (err =3D=3D -ENOENT)
> e4de9a35b08dcf Jeff Layton 2020-05-21  220  		err =3D 0;
> e4de9a35b08dcf Jeff Layton 2020-05-21  221  	else if (err =3D=3D -EBLACKL=
ISTED)
> e4de9a35b08dcf Jeff Layton 2020-05-21  222  		fsc->blacklisted =3D true;
> abd9e1c4c6c6d8 Jeff Layton 2020-05-26  223  out:
> e4de9a35b08dcf Jeff Layton 2020-05-21  224  	dout("readpage result %d\n",=
 err);
> e4de9a35b08dcf Jeff Layton 2020-05-21 @225  	fsreq->error =3D err;
> e4de9a35b08dcf Jeff Layton 2020-05-21  226  	if (fsreq->io_done)
> e4de9a35b08dcf Jeff Layton 2020-05-21  227  		fsreq->io_done(fsreq);
> e4de9a35b08dcf Jeff Layton 2020-05-21  228  }
> e4de9a35b08dcf Jeff Layton 2020-05-21  229  =

> =


Thanks for the report(s).

This branch is still very much a work in progress, so it's not at all
surprising it has bugs. Yes, it's publicly available, but I mainly
pushed it for backup purposes.

I wonder -- is there a way to name my branches so that they don't get
picked up by the 0-day service? I generally like the testing, but when I
still have a branch that's not yet fully baked it's probably a bit of
waste. Maybe if we could prefix it with "wip-" or something?

Then, when I think it's ready for 0-day I can just rename the branch.

Thanks,
-- =

Jeff Layton <jlayton@kernel.org>

--===============4149455094333645638==--

