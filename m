Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEDC1C3BF7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 01:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763171050; cv=none; b=W5m5yWmXeUqKZi81KN13sSg8x5R0Hsyr75hjr1BJd35gAPeQWabJJqk8P4TK5eX6L8jYCIVLFFuZt6ne68cmrlCVLFvzDxA0eDnWhtQ4P1N5Y+xSDd5H9v9GboHnj1sqr+RqFExvZJh/3TZ5sU4yv63VRrVUXc9TPerzeoKQG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763171050; c=relaxed/simple;
	bh=zhtxCkKXs9GY52qTKgRKbISfmfbyS38g/glnPmEkBoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pAKW9Etbllu5N0i8y6To42hLOG4Q9kN+SYtUThfT/++cn94/Qs449tfW9UmfaNjMd4CDmIqwztsNAp4YgZ54mRLj0lXCi8bh1+0elj4chlVBc178vKZkbWwyX/1viYF3rKn3kaidVmEiiq/M3MFp9RjkMw+4Jn1Fpeqe3AGjUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVBbepWG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVBbepWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763171048; x=1794707048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zhtxCkKXs9GY52qTKgRKbISfmfbyS38g/glnPmEkBoQ=;
  b=UVBbepWGq+L5ZZ4nJMyLe2JJ7pu5RJIFBaESNm4lrYCmRcVlHObl0boa
   71NPuojzRPcTZWXjb2Rtnd0lOHTg7XVRGUA1HrHKLCJwzoxb0M5Ze7PSk
   C4YRVgaLE2NLFx2j/CNlMSuDX9/mZzytKXywMzlYAkBH3NygIcaY+tTOB
   kMxuqkuEX1nbU1ahJdDSXjIZ72o+x9SoJDof5BDaQpLZTkzzcgDPg5853
   xTXq/VBtU9AcXkh2xPuBPTm9m16iprJ/7Hq8HBZ7LaS06XGuu1KSw9/Px
   r48CvlVLZ/iqG9NaBR3ujXCYk7Jku9g9qWCEN0DA01Mzc22xojP3lW8Sg
   g==;
X-CSE-ConnectionGUID: ua/TZiqrS2K3dyBLTEqAkA==
X-CSE-MsgGUID: saur5cZQS9Kplqbg5VceVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75588019"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="75588019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 17:44:05 -0800
X-CSE-ConnectionGUID: HXdz/uEdQDSCbttC4qJXpg==
X-CSE-MsgGUID: OLuchgJRQyyAlYvIRhGS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="220558797"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2025 17:44:04 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK5Kb-0007cl-25;
	Sat, 15 Nov 2025 01:44:01 +0000
Date: Sat, 15 Nov 2025 09:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nfs-delegation-lru 1/20] fs/nfs/fs_context.c:1038:31:
 error: use of undeclared identifier 'NFS4_CLIENT_ID_UNIQ_LEN'
Message-ID: <202511150907.tXE4cnCG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nfs-delegation-lru
head:   09afc7e968dff67a9a0c9c728b08b8478841357d
commit: c65fef6305a69cce790947f7fbd549e305020669 [1/20] TEMP: NFS: add a clientid mount option
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20251115/202511150907.tXE4cnCG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150907.tXE4cnCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150907.tXE4cnCG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/fs_context.c:1038:31: error: use of undeclared identifier 'NFS4_CLIENT_ID_UNIQ_LEN'
    1038 |                     strlen(param->string) > NFS4_CLIENT_ID_UNIQ_LEN - 1)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/NFS4_CLIENT_ID_UNIQ_LEN +1038 fs/nfs/fs_context.c

   585	
   586	/*
   587	 * Parse a single mount parameter.
   588	 */
   589	static int nfs_fs_context_parse_param(struct fs_context *fc,
   590					      struct fs_parameter *param)
   591	{
   592		struct fs_parse_result result;
   593		struct nfs_fs_context *ctx = nfs_fc2context(fc);
   594		unsigned short protofamily, mountfamily;
   595		unsigned int len;
   596		int ret, opt;
   597	
   598		trace_nfs_mount_option(param);
   599	
   600		opt = fs_parse(fc, nfs_fs_parameters, param, &result);
   601		if (opt < 0)
   602			return (opt == -ENOPARAM && ctx->sloppy) ? 1 : opt;
   603	
   604		if (fc->security)
   605			ctx->has_sec_mnt_opts = 1;
   606	
   607		switch (opt) {
   608		case Opt_source:
   609			if (fc->source)
   610				return nfs_invalf(fc, "NFS: Multiple sources not supported");
   611			fc->source = param->string;
   612			param->string = NULL;
   613			break;
   614	
   615			/*
   616			 * boolean options:  foo/nofoo
   617			 */
   618		case Opt_soft:
   619			ctx->flags |= NFS_MOUNT_SOFT;
   620			ctx->flags &= ~NFS_MOUNT_SOFTERR;
   621			break;
   622		case Opt_softerr:
   623			ctx->flags |= NFS_MOUNT_SOFTERR | NFS_MOUNT_SOFTREVAL;
   624			ctx->flags &= ~NFS_MOUNT_SOFT;
   625			break;
   626		case Opt_hard:
   627			ctx->flags &= ~(NFS_MOUNT_SOFT |
   628					NFS_MOUNT_SOFTERR |
   629					NFS_MOUNT_SOFTREVAL);
   630			break;
   631		case Opt_softreval:
   632			if (result.negated)
   633				ctx->flags &= ~NFS_MOUNT_SOFTREVAL;
   634			else
   635				ctx->flags |= NFS_MOUNT_SOFTREVAL;
   636			break;
   637		case Opt_posix:
   638			if (result.negated)
   639				ctx->flags &= ~NFS_MOUNT_POSIX;
   640			else
   641				ctx->flags |= NFS_MOUNT_POSIX;
   642			break;
   643		case Opt_cto:
   644			if (result.negated)
   645				ctx->flags |= NFS_MOUNT_NOCTO;
   646			else
   647				ctx->flags &= ~NFS_MOUNT_NOCTO;
   648			break;
   649		case Opt_trunkdiscovery:
   650			if (result.negated)
   651				ctx->flags &= ~NFS_MOUNT_TRUNK_DISCOVERY;
   652			else
   653				ctx->flags |= NFS_MOUNT_TRUNK_DISCOVERY;
   654			break;
   655		case Opt_alignwrite:
   656			if (result.negated)
   657				ctx->flags |= NFS_MOUNT_NO_ALIGNWRITE;
   658			else
   659				ctx->flags &= ~NFS_MOUNT_NO_ALIGNWRITE;
   660			break;
   661		case Opt_ac:
   662			if (result.negated)
   663				ctx->flags |= NFS_MOUNT_NOAC;
   664			else
   665				ctx->flags &= ~NFS_MOUNT_NOAC;
   666			break;
   667		case Opt_lock:
   668			if (result.negated) {
   669				ctx->lock_status = NFS_LOCK_NOLOCK;
   670				ctx->flags |= NFS_MOUNT_NONLM;
   671				ctx->flags |= (NFS_MOUNT_LOCAL_FLOCK | NFS_MOUNT_LOCAL_FCNTL);
   672			} else {
   673				ctx->lock_status = NFS_LOCK_LOCK;
   674				ctx->flags &= ~NFS_MOUNT_NONLM;
   675				ctx->flags &= ~(NFS_MOUNT_LOCAL_FLOCK | NFS_MOUNT_LOCAL_FCNTL);
   676			}
   677			break;
   678		case Opt_udp:
   679			ctx->flags &= ~NFS_MOUNT_TCP;
   680			ctx->nfs_server.protocol = XPRT_TRANSPORT_UDP;
   681			break;
   682		case Opt_tcp:
   683		case Opt_rdma:
   684			ctx->flags |= NFS_MOUNT_TCP; /* for side protocols */
   685			ret = xprt_find_transport_ident(param->key);
   686			if (ret < 0)
   687				goto out_bad_transport;
   688			ctx->nfs_server.protocol = ret;
   689			break;
   690		case Opt_acl:
   691			if (result.negated)
   692				ctx->flags |= NFS_MOUNT_NOACL;
   693			else
   694				ctx->flags &= ~NFS_MOUNT_NOACL;
   695			break;
   696		case Opt_rdirplus:
   697			if (result.negated) {
   698				ctx->flags &= ~NFS_MOUNT_FORCE_RDIRPLUS;
   699				ctx->flags |= NFS_MOUNT_NORDIRPLUS;
   700			} else if (!param->string) {
   701				ctx->flags &= ~(NFS_MOUNT_NORDIRPLUS | NFS_MOUNT_FORCE_RDIRPLUS);
   702			} else {
   703				switch (lookup_constant(nfs_rdirplus_tokens, param->string, -1)) {
   704				case Opt_rdirplus_none:
   705					ctx->flags &= ~NFS_MOUNT_FORCE_RDIRPLUS;
   706					ctx->flags |= NFS_MOUNT_NORDIRPLUS;
   707					break;
   708				case Opt_rdirplus_force:
   709					ctx->flags &= ~NFS_MOUNT_NORDIRPLUS;
   710					ctx->flags |= NFS_MOUNT_FORCE_RDIRPLUS;
   711					break;
   712				default:
   713					goto out_invalid_value;
   714				}
   715			}
   716			break;
   717		case Opt_sharecache:
   718			if (result.negated)
   719				ctx->flags |= NFS_MOUNT_UNSHARED;
   720			else
   721				ctx->flags &= ~NFS_MOUNT_UNSHARED;
   722			break;
   723		case Opt_resvport:
   724			if (result.negated)
   725				ctx->flags |= NFS_MOUNT_NORESVPORT;
   726			else
   727				ctx->flags &= ~NFS_MOUNT_NORESVPORT;
   728			break;
   729		case Opt_fscache_flag:
   730			if (result.negated)
   731				ctx->options &= ~NFS_OPTION_FSCACHE;
   732			else
   733				ctx->options |= NFS_OPTION_FSCACHE;
   734			kfree(ctx->fscache_uniq);
   735			ctx->fscache_uniq = NULL;
   736			break;
   737		case Opt_fscache:
   738			trace_nfs_mount_assign(param->key, param->string);
   739			ctx->options |= NFS_OPTION_FSCACHE;
   740			kfree(ctx->fscache_uniq);
   741			ctx->fscache_uniq = param->string;
   742			param->string = NULL;
   743			break;
   744		case Opt_migration:
   745			if (result.negated)
   746				ctx->options &= ~NFS_OPTION_MIGRATION;
   747			else
   748				ctx->options |= NFS_OPTION_MIGRATION;
   749			break;
   750	
   751			/*
   752			 * options that take numeric values
   753			 */
   754		case Opt_port:
   755			if (result.uint_32 > USHRT_MAX)
   756				goto out_of_bounds;
   757			ctx->nfs_server.port = result.uint_32;
   758			break;
   759		case Opt_rsize:
   760			ctx->rsize = result.uint_32;
   761			break;
   762		case Opt_wsize:
   763			ctx->wsize = result.uint_32;
   764			break;
   765		case Opt_bsize:
   766			ctx->bsize = result.uint_32;
   767			break;
   768		case Opt_timeo:
   769			if (result.uint_32 < 1 || result.uint_32 > INT_MAX)
   770				goto out_of_bounds;
   771			ctx->timeo = result.uint_32;
   772			break;
   773		case Opt_retrans:
   774			if (result.uint_32 > INT_MAX)
   775				goto out_of_bounds;
   776			ctx->retrans = result.uint_32;
   777			break;
   778		case Opt_acregmin:
   779			ctx->acregmin = result.uint_32;
   780			break;
   781		case Opt_acregmax:
   782			ctx->acregmax = result.uint_32;
   783			break;
   784		case Opt_acdirmin:
   785			ctx->acdirmin = result.uint_32;
   786			break;
   787		case Opt_acdirmax:
   788			ctx->acdirmax = result.uint_32;
   789			break;
   790		case Opt_actimeo:
   791			ctx->acregmin = result.uint_32;
   792			ctx->acregmax = result.uint_32;
   793			ctx->acdirmin = result.uint_32;
   794			ctx->acdirmax = result.uint_32;
   795			break;
   796		case Opt_namelen:
   797			ctx->namlen = result.uint_32;
   798			break;
   799		case Opt_mountport:
   800			if (result.uint_32 > USHRT_MAX)
   801				goto out_of_bounds;
   802			ctx->mount_server.port = result.uint_32;
   803			break;
   804		case Opt_mountvers:
   805			if (result.uint_32 < NFS_MNT_VERSION ||
   806			    result.uint_32 > NFS_MNT3_VERSION)
   807				goto out_of_bounds;
   808			ctx->mount_server.version = result.uint_32;
   809			break;
   810		case Opt_minorversion:
   811			if (result.uint_32 > NFS4_MAX_MINOR_VERSION)
   812				goto out_of_bounds;
   813			ctx->minorversion = result.uint_32;
   814			break;
   815	
   816			/*
   817			 * options that take text values
   818			 */
   819		case Opt_v:
   820			ret = nfs_parse_version_string(fc, param->key + 1);
   821			if (ret < 0)
   822				return ret;
   823			break;
   824		case Opt_vers:
   825			if (!param->string)
   826				goto out_invalid_value;
   827			trace_nfs_mount_assign(param->key, param->string);
   828			ret = nfs_parse_version_string(fc, param->string);
   829			if (ret < 0)
   830				return ret;
   831			break;
   832		case Opt_sec:
   833			ret = nfs_parse_security_flavors(fc, param);
   834			if (ret < 0)
   835				return ret;
   836			break;
   837		case Opt_xprtsec:
   838			ret = nfs_parse_xprtsec_policy(fc, param);
   839			if (ret < 0)
   840				return ret;
   841			break;
   842		case Opt_cert_serial:
   843			ret = nfs_tls_key_verify(result.int_32);
   844			if (ret < 0)
   845				return ret;
   846			ctx->xprtsec.cert_serial = result.int_32;
   847			break;
   848		case Opt_privkey_serial:
   849			ret = nfs_tls_key_verify(result.int_32);
   850			if (ret < 0)
   851				return ret;
   852			ctx->xprtsec.privkey_serial = result.int_32;
   853			break;
   854	
   855		case Opt_proto:
   856			if (!param->string)
   857				goto out_invalid_value;
   858			trace_nfs_mount_assign(param->key, param->string);
   859			protofamily = AF_INET;
   860			switch (lookup_constant(nfs_xprt_protocol_tokens, param->string, -1)) {
   861			case Opt_xprt_udp6:
   862				protofamily = AF_INET6;
   863				fallthrough;
   864			case Opt_xprt_udp:
   865				ctx->flags &= ~NFS_MOUNT_TCP;
   866				ctx->nfs_server.protocol = XPRT_TRANSPORT_UDP;
   867				break;
   868			case Opt_xprt_tcp6:
   869				protofamily = AF_INET6;
   870				fallthrough;
   871			case Opt_xprt_tcp:
   872				ctx->flags |= NFS_MOUNT_TCP;
   873				ctx->nfs_server.protocol = XPRT_TRANSPORT_TCP;
   874				break;
   875			case Opt_xprt_rdma6:
   876				protofamily = AF_INET6;
   877				fallthrough;
   878			case Opt_xprt_rdma:
   879				/* vector side protocols to TCP */
   880				ctx->flags |= NFS_MOUNT_TCP;
   881				ret = xprt_find_transport_ident(param->string);
   882				if (ret < 0)
   883					goto out_bad_transport;
   884				ctx->nfs_server.protocol = ret;
   885				break;
   886			default:
   887				goto out_bad_transport;
   888			}
   889	
   890			ctx->protofamily = protofamily;
   891			break;
   892	
   893		case Opt_mountproto:
   894			if (!param->string)
   895				goto out_invalid_value;
   896			trace_nfs_mount_assign(param->key, param->string);
   897			mountfamily = AF_INET;
   898			switch (lookup_constant(nfs_xprt_protocol_tokens, param->string, -1)) {
   899			case Opt_xprt_udp6:
   900				mountfamily = AF_INET6;
   901				fallthrough;
   902			case Opt_xprt_udp:
   903				ctx->mount_server.protocol = XPRT_TRANSPORT_UDP;
   904				break;
   905			case Opt_xprt_tcp6:
   906				mountfamily = AF_INET6;
   907				fallthrough;
   908			case Opt_xprt_tcp:
   909				ctx->mount_server.protocol = XPRT_TRANSPORT_TCP;
   910				break;
   911			case Opt_xprt_rdma: /* not used for side protocols */
   912			default:
   913				goto out_bad_transport;
   914			}
   915			ctx->mountfamily = mountfamily;
   916			break;
   917	
   918		case Opt_addr:
   919			trace_nfs_mount_assign(param->key, param->string);
   920			len = rpc_pton(fc->net_ns, param->string, param->size,
   921				       &ctx->nfs_server.address,
   922				       sizeof(ctx->nfs_server._address));
   923			if (len == 0)
   924				goto out_invalid_address;
   925			ctx->nfs_server.addrlen = len;
   926			break;
   927		case Opt_clientaddr:
   928			trace_nfs_mount_assign(param->key, param->string);
   929			kfree(ctx->client_address);
   930			ctx->client_address = param->string;
   931			param->string = NULL;
   932			break;
   933		case Opt_mounthost:
   934			trace_nfs_mount_assign(param->key, param->string);
   935			kfree(ctx->mount_server.hostname);
   936			ctx->mount_server.hostname = param->string;
   937			param->string = NULL;
   938			break;
   939		case Opt_mountaddr:
   940			trace_nfs_mount_assign(param->key, param->string);
   941			len = rpc_pton(fc->net_ns, param->string, param->size,
   942				       &ctx->mount_server.address,
   943				       sizeof(ctx->mount_server._address));
   944			if (len == 0)
   945				goto out_invalid_address;
   946			ctx->mount_server.addrlen = len;
   947			break;
   948		case Opt_nconnect:
   949			trace_nfs_mount_assign(param->key, param->string);
   950			if (result.uint_32 < 1 || result.uint_32 > NFS_MAX_CONNECTIONS)
   951				goto out_of_bounds;
   952			ctx->nfs_server.nconnect = result.uint_32;
   953			break;
   954		case Opt_max_connect:
   955			trace_nfs_mount_assign(param->key, param->string);
   956			if (result.uint_32 < 1 || result.uint_32 > NFS_MAX_TRANSPORTS)
   957				goto out_of_bounds;
   958			ctx->nfs_server.max_connect = result.uint_32;
   959			break;
   960		case Opt_fatal_neterrors:
   961			trace_nfs_mount_assign(param->key, param->string);
   962			switch (result.uint_32) {
   963			case Opt_fatal_neterrors_default:
   964				if (fc->net_ns != &init_net)
   965					ctx->flags |= NFS_MOUNT_NETUNREACH_FATAL;
   966				else
   967					ctx->flags &= ~NFS_MOUNT_NETUNREACH_FATAL;
   968				break;
   969			case Opt_fatal_neterrors_enetunreach:
   970				ctx->flags |= NFS_MOUNT_NETUNREACH_FATAL;
   971				break;
   972			case Opt_fatal_neterrors_none:
   973				ctx->flags &= ~NFS_MOUNT_NETUNREACH_FATAL;
   974				break;
   975			default:
   976				goto out_invalid_value;
   977			}
   978			break;
   979		case Opt_lookupcache:
   980			trace_nfs_mount_assign(param->key, param->string);
   981			switch (result.uint_32) {
   982			case Opt_lookupcache_all:
   983				ctx->flags &= ~(NFS_MOUNT_LOOKUP_CACHE_NONEG|NFS_MOUNT_LOOKUP_CACHE_NONE);
   984				break;
   985			case Opt_lookupcache_positive:
   986				ctx->flags &= ~NFS_MOUNT_LOOKUP_CACHE_NONE;
   987				ctx->flags |= NFS_MOUNT_LOOKUP_CACHE_NONEG;
   988				break;
   989			case Opt_lookupcache_none:
   990				ctx->flags |= NFS_MOUNT_LOOKUP_CACHE_NONEG|NFS_MOUNT_LOOKUP_CACHE_NONE;
   991				break;
   992			default:
   993				goto out_invalid_value;
   994			}
   995			break;
   996		case Opt_local_lock:
   997			trace_nfs_mount_assign(param->key, param->string);
   998			switch (result.uint_32) {
   999			case Opt_local_lock_all:
  1000				ctx->flags |= (NFS_MOUNT_LOCAL_FLOCK |
  1001					       NFS_MOUNT_LOCAL_FCNTL);
  1002				break;
  1003			case Opt_local_lock_flock:
  1004				ctx->flags |= NFS_MOUNT_LOCAL_FLOCK;
  1005				break;
  1006			case Opt_local_lock_posix:
  1007				ctx->flags |= NFS_MOUNT_LOCAL_FCNTL;
  1008				break;
  1009			case Opt_local_lock_none:
  1010				ctx->flags &= ~(NFS_MOUNT_LOCAL_FLOCK |
  1011						NFS_MOUNT_LOCAL_FCNTL);
  1012				break;
  1013			default:
  1014				goto out_invalid_value;
  1015			}
  1016			break;
  1017		case Opt_write:
  1018			trace_nfs_mount_assign(param->key, param->string);
  1019			switch (result.uint_32) {
  1020			case Opt_write_lazy:
  1021				ctx->flags &=
  1022					~(NFS_MOUNT_WRITE_EAGER | NFS_MOUNT_WRITE_WAIT);
  1023				break;
  1024			case Opt_write_eager:
  1025				ctx->flags |= NFS_MOUNT_WRITE_EAGER;
  1026				ctx->flags &= ~NFS_MOUNT_WRITE_WAIT;
  1027				break;
  1028			case Opt_write_wait:
  1029				ctx->flags |=
  1030					NFS_MOUNT_WRITE_EAGER | NFS_MOUNT_WRITE_WAIT;
  1031				break;
  1032			default:
  1033				goto out_invalid_value;
  1034			}
  1035			break;
  1036		case Opt_clientid:
  1037			if (!param->string || strlen(param->string) == 0 ||
> 1038			    strlen(param->string) > NFS4_CLIENT_ID_UNIQ_LEN - 1)
  1039				goto out_of_bounds;
  1040			kfree(ctx->clientid);
  1041			ctx->clientid = param->string;
  1042			param->string = NULL;
  1043			break;
  1044	
  1045			/*
  1046			 * Special options
  1047			 */
  1048		case Opt_sloppy:
  1049			ctx->sloppy = true;
  1050			break;
  1051		}
  1052	
  1053		return 0;
  1054	
  1055	out_invalid_value:
  1056		return nfs_invalf(fc, "NFS: Bad mount option value specified");
  1057	out_invalid_address:
  1058		return nfs_invalf(fc, "NFS: Bad IP address specified");
  1059	out_of_bounds:
  1060		return nfs_invalf(fc, "NFS: Value for '%s' out of range", param->key);
  1061	out_bad_transport:
  1062		return nfs_invalf(fc, "NFS: Unrecognized transport protocol");
  1063	}
  1064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
