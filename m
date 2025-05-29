Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4921A4E9D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 01:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481195; cv=none; b=FaG1ji8jb1x+/Psbl0gk1jr0A665/Kg6A9BDObGfSnHR77VpN8g+H5v6Tcul8fguD+9q3DT+/JULId/zrgqxgD7JZ+hL8jLFhA8Y1o3eMqi6shi3uVwuDGDJB67ChVS+4E1g6wP2c/OzisfimbxM2zNHGzqMaftoMmSmig6zNBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481195; c=relaxed/simple;
	bh=lJulj1ynAk0vOWSvzJY7AbLTWuq3yVvZ1eIPJB9nxVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tepHTXQJa5Si68wKM24ck602Vi4h6i6A6ek+LfZP5ZDGClPUtWXJF3WSbxcuf9fG2B5xt4ltDa/HebbNjjrUkSua78IIke0Wp7h22ksq77g3o5fQ2FK+AXzxPvDmNagBUUpMdK7T5vX7VxhuyzcxW1Yzh/zlEOLnc2xSE3Qrrdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLIaczv8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLIaczv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748481193; x=1780017193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lJulj1ynAk0vOWSvzJY7AbLTWuq3yVvZ1eIPJB9nxVw=;
  b=MLIaczv8x6kXmCrk1QmXFHMneHexoZutr9r9rEQoJT2FGQXT4YX3vuMx
   DfLwn9vqSTtHD29xwM+ux9yVxworuCcLQyeb0wVBOrhEjqnQBlDLYWvvd
   ClpKcCS++NizT1hlCijBHi0o2DvzgpKK/czo8Y+BCkRv9mW3UHpLZTDC6
   9J7CM+n4OvhoLLa+zTzZC9PRb9czUZm1Vwyb0yNKTsOStZ0u4lLtkXC1w
   J7VYDEsSVZWx9ApXV215o7hUFq+2zlbtWXql7BJyOgcDDNfWRRmrrPlhD
   nig8vQkgUkbjhIFM7hMfmhsEBTAsx0z+RLI2l7aNFTCD6LXYb2j/PSNC1
   A==;
X-CSE-ConnectionGUID: BPHNxfFYQPmtD3KzDcnSmA==
X-CSE-MsgGUID: jgpDen1ZTkOjAL74NdYv0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61163936"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="61163936"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 18:13:13 -0700
X-CSE-ConnectionGUID: sh72MhMWTbC5D4NXvWyz3A==
X-CSE-MsgGUID: 2fDVvx3QQZKI1O6I8szqNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="180619923"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 May 2025 18:13:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKRpV-000WCm-07;
	Thu, 29 May 2025 01:13:09 +0000
Date: Thu, 29 May 2025 09:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v2 11/12]
 drivers/nvme/host/fabrics.c:1008:39: error: implicit declaration of function
 'request_key'; did you mean 'request_nmi'?
Message-ID: <202505290901.nhrHQLO5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v2
head:   c5ed772b69417de8426d03da86a9ba8e7a03ccd9
commit: 60725ff21577dece43a40f5e3928abea9aadc671 [11/12] nvme-fabrics: allow to pass in keyring by name
config: sparc-randconfig-001-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290901.nhrHQLO5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290901.nhrHQLO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290901.nhrHQLO5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:16:
   include/linux/nvme-keyring.h:54:1: error: expected identifier or '(' before '{' token
      54 | {
         | ^
   include/linux/nvme-keyring.h:57:4: warning: no previous prototype for 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/fabrics.c: In function 'nvmf_parse_options':
>> drivers/nvme/host/fabrics.c:1008:39: error: implicit declaration of function 'request_key'; did you mean 'request_nmi'? [-Werror=implicit-function-declaration]
    1008 |                                 key = request_key(&key_type_keyring, p, NULL);
         |                                       ^~~~~~~~~~~
         |                                       request_nmi
>> drivers/nvme/host/fabrics.c:1008:52: error: 'key_type_keyring' undeclared (first use in this function)
    1008 |                                 key = request_key(&key_type_keyring, p, NULL);
         |                                                    ^~~~~~~~~~~~~~~~
   drivers/nvme/host/fabrics.c:1008:52: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/nvme/host/fabrics.c:16:
   drivers/nvme/host/fabrics.c: At top level:
   include/linux/nvme-keyring.h:52:27: warning: 'nvme_dhchap_psk_lookup' declared 'static' but never defined [-Wunused-function]
      52 | static inline struct key *nvme_dhchap_psk_lookup(struct key *keyring,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-unterminated-string-initialization' may have been intended to silence earlier diagnostics
   cc1: some warnings being treated as errors


vim +1008 drivers/nvme/host/fabrics.c

   716	
   717	static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
   718			const char *buf)
   719	{
   720		substring_t args[MAX_OPT_ARGS];
   721		char *options, *o, *p;
   722		char *host_secret = NULL, *ctrl_secret = NULL;
   723		int token, ret = 0;
   724		size_t nqnlen  = 0;
   725		int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
   726		uuid_t hostid;
   727		char hostnqn[NVMF_NQN_SIZE];
   728		struct key *key;
   729	
   730		/* Set defaults */
   731		opts->queue_size = NVMF_DEF_QUEUE_SIZE;
   732		opts->nr_io_queues = num_online_cpus();
   733		opts->reconnect_delay = NVMF_DEF_RECONNECT_DELAY;
   734		opts->kato = 0;
   735		opts->duplicate_connect = false;
   736		opts->fast_io_fail_tmo = NVMF_DEF_FAIL_FAST_TMO;
   737		opts->hdr_digest = false;
   738		opts->data_digest = false;
   739		opts->tos = -1; /* < 0 == use transport default */
   740		opts->tls = false;
   741		opts->tls_key = NULL;
   742		opts->keyring = NULL;
   743		opts->concat = false;
   744		opts->dhchap_key = NULL;
   745		opts->dhchap_key_generated = false;
   746		opts->dhchap_ctrl_key = NULL;
   747		opts->dhchap_ctrl_key_generated = false;
   748	
   749		options = o = kstrdup(buf, GFP_KERNEL);
   750		if (!options)
   751			return -ENOMEM;
   752	
   753		/* use default host if not given by user space */
   754		uuid_copy(&hostid, &nvmf_default_host->id);
   755		strscpy(hostnqn, nvmf_default_host->nqn, NVMF_NQN_SIZE);
   756	
   757		while ((p = strsep(&o, ",\n")) != NULL) {
   758			if (!*p)
   759				continue;
   760	
   761			token = match_token(p, opt_tokens, args);
   762			opts->mask |= token;
   763			switch (token) {
   764			case NVMF_OPT_TRANSPORT:
   765				p = match_strdup(args);
   766				if (!p) {
   767					ret = -ENOMEM;
   768					goto out;
   769				}
   770				kfree(opts->transport);
   771				opts->transport = p;
   772				break;
   773			case NVMF_OPT_NQN:
   774				p = match_strdup(args);
   775				if (!p) {
   776					ret = -ENOMEM;
   777					goto out;
   778				}
   779				kfree(opts->subsysnqn);
   780				opts->subsysnqn = p;
   781				nqnlen = strlen(opts->subsysnqn);
   782				if (nqnlen >= NVMF_NQN_SIZE) {
   783					pr_err("%s needs to be < %d bytes\n",
   784						opts->subsysnqn, NVMF_NQN_SIZE);
   785					ret = -EINVAL;
   786					goto out;
   787				}
   788				opts->discovery_nqn =
   789					!(strcmp(opts->subsysnqn,
   790						 NVME_DISC_SUBSYS_NAME));
   791				break;
   792			case NVMF_OPT_TRADDR:
   793				p = match_strdup(args);
   794				if (!p) {
   795					ret = -ENOMEM;
   796					goto out;
   797				}
   798				kfree(opts->traddr);
   799				opts->traddr = p;
   800				break;
   801			case NVMF_OPT_TRSVCID:
   802				p = match_strdup(args);
   803				if (!p) {
   804					ret = -ENOMEM;
   805					goto out;
   806				}
   807				kfree(opts->trsvcid);
   808				opts->trsvcid = p;
   809				break;
   810			case NVMF_OPT_QUEUE_SIZE:
   811				if (match_int(args, &token)) {
   812					ret = -EINVAL;
   813					goto out;
   814				}
   815				if (token < NVMF_MIN_QUEUE_SIZE ||
   816				    token > NVMF_MAX_QUEUE_SIZE) {
   817					pr_err("Invalid queue_size %d\n", token);
   818					ret = -EINVAL;
   819					goto out;
   820				}
   821				opts->queue_size = token;
   822				break;
   823			case NVMF_OPT_NR_IO_QUEUES:
   824				if (match_int(args, &token)) {
   825					ret = -EINVAL;
   826					goto out;
   827				}
   828				if (token <= 0) {
   829					pr_err("Invalid number of IOQs %d\n", token);
   830					ret = -EINVAL;
   831					goto out;
   832				}
   833				if (opts->discovery_nqn) {
   834					pr_debug("Ignoring nr_io_queues value for discovery controller\n");
   835					break;
   836				}
   837	
   838				opts->nr_io_queues = min_t(unsigned int,
   839						num_online_cpus(), token);
   840				break;
   841			case NVMF_OPT_KATO:
   842				if (match_int(args, &token)) {
   843					ret = -EINVAL;
   844					goto out;
   845				}
   846	
   847				if (token < 0) {
   848					pr_err("Invalid keep_alive_tmo %d\n", token);
   849					ret = -EINVAL;
   850					goto out;
   851				} else if (token == 0 && !opts->discovery_nqn) {
   852					/* Allowed for debug */
   853					pr_warn("keep_alive_tmo 0 won't execute keep alives!!!\n");
   854				}
   855				opts->kato = token;
   856				break;
   857			case NVMF_OPT_CTRL_LOSS_TMO:
   858				if (match_int(args, &token)) {
   859					ret = -EINVAL;
   860					goto out;
   861				}
   862	
   863				if (token < 0)
   864					pr_warn("ctrl_loss_tmo < 0 will reconnect forever\n");
   865				ctrl_loss_tmo = token;
   866				break;
   867			case NVMF_OPT_FAIL_FAST_TMO:
   868				if (match_int(args, &token)) {
   869					ret = -EINVAL;
   870					goto out;
   871				}
   872	
   873				if (token >= 0)
   874					pr_warn("I/O fail on reconnect controller after %d sec\n",
   875						token);
   876				else
   877					token = -1;
   878	
   879				opts->fast_io_fail_tmo = token;
   880				break;
   881			case NVMF_OPT_HOSTNQN:
   882				if (opts->host) {
   883					pr_err("hostnqn already user-assigned: %s\n",
   884					       opts->host->nqn);
   885					ret = -EADDRINUSE;
   886					goto out;
   887				}
   888				p = match_strdup(args);
   889				if (!p) {
   890					ret = -ENOMEM;
   891					goto out;
   892				}
   893				nqnlen = strlen(p);
   894				if (nqnlen >= NVMF_NQN_SIZE) {
   895					pr_err("%s needs to be < %d bytes\n",
   896						p, NVMF_NQN_SIZE);
   897					kfree(p);
   898					ret = -EINVAL;
   899					goto out;
   900				}
   901				strscpy(hostnqn, p, NVMF_NQN_SIZE);
   902				kfree(p);
   903				break;
   904			case NVMF_OPT_RECONNECT_DELAY:
   905				if (match_int(args, &token)) {
   906					ret = -EINVAL;
   907					goto out;
   908				}
   909				if (token <= 0) {
   910					pr_err("Invalid reconnect_delay %d\n", token);
   911					ret = -EINVAL;
   912					goto out;
   913				}
   914				opts->reconnect_delay = token;
   915				break;
   916			case NVMF_OPT_HOST_TRADDR:
   917				p = match_strdup(args);
   918				if (!p) {
   919					ret = -ENOMEM;
   920					goto out;
   921				}
   922				kfree(opts->host_traddr);
   923				opts->host_traddr = p;
   924				break;
   925			case NVMF_OPT_HOST_IFACE:
   926				p = match_strdup(args);
   927				if (!p) {
   928					ret = -ENOMEM;
   929					goto out;
   930				}
   931				kfree(opts->host_iface);
   932				opts->host_iface = p;
   933				break;
   934			case NVMF_OPT_HOST_ID:
   935				p = match_strdup(args);
   936				if (!p) {
   937					ret = -ENOMEM;
   938					goto out;
   939				}
   940				ret = uuid_parse(p, &hostid);
   941				if (ret) {
   942					pr_err("Invalid hostid %s\n", p);
   943					ret = -EINVAL;
   944					kfree(p);
   945					goto out;
   946				}
   947				kfree(p);
   948				break;
   949			case NVMF_OPT_DUP_CONNECT:
   950				opts->duplicate_connect = true;
   951				break;
   952			case NVMF_OPT_DISABLE_SQFLOW:
   953				opts->disable_sqflow = true;
   954				break;
   955			case NVMF_OPT_HDR_DIGEST:
   956				opts->hdr_digest = true;
   957				break;
   958			case NVMF_OPT_DATA_DIGEST:
   959				opts->data_digest = true;
   960				break;
   961			case NVMF_OPT_NR_WRITE_QUEUES:
   962				if (match_int(args, &token)) {
   963					ret = -EINVAL;
   964					goto out;
   965				}
   966				if (token <= 0) {
   967					pr_err("Invalid nr_write_queues %d\n", token);
   968					ret = -EINVAL;
   969					goto out;
   970				}
   971				opts->nr_write_queues = token;
   972				break;
   973			case NVMF_OPT_NR_POLL_QUEUES:
   974				if (match_int(args, &token)) {
   975					ret = -EINVAL;
   976					goto out;
   977				}
   978				if (token <= 0) {
   979					pr_err("Invalid nr_poll_queues %d\n", token);
   980					ret = -EINVAL;
   981					goto out;
   982				}
   983				opts->nr_poll_queues = token;
   984				break;
   985			case NVMF_OPT_TOS:
   986				if (match_int(args, &token)) {
   987					ret = -EINVAL;
   988					goto out;
   989				}
   990				if (token < 0) {
   991					pr_err("Invalid type of service %d\n", token);
   992					ret = -EINVAL;
   993					goto out;
   994				}
   995				if (token > 255) {
   996					pr_warn("Clamping type of service to 255\n");
   997					token = 255;
   998				}
   999				opts->tos = token;
  1000				break;
  1001			case NVMF_OPT_KEYRING:
  1002				if (match_int(args, &key_id) || key_id <= 0) {
  1003					p = match_strdup(args);
  1004					if (!p) {
  1005						ret = -ENOMEM;
  1006						goto out;
  1007					}
> 1008					key = request_key(&key_type_keyring, p, NULL);
  1009					kfree(p);
  1010					if (IS_ERR(key)) {
  1011						ret = PTR_ERR(key);
  1012						goto out;
  1013					}
  1014				} else {
  1015					key = nvmf_parse_key(key_id);
  1016					if (IS_ERR(key)) {
  1017						ret = PTR_ERR(key);
  1018						goto out;
  1019					}
  1020				}
  1021				key_put(opts->keyring);
  1022				opts->keyring = key;
  1023				break;
  1024			case NVMF_OPT_TLS_KEY:
  1025				if (match_int(args, &key_id) || key_id <= 0) {
  1026					ret = -EINVAL;
  1027					goto out;
  1028				}
  1029				key = nvmf_parse_key(key_id);
  1030				if (IS_ERR(key)) {
  1031					ret = PTR_ERR(key);
  1032					goto out;
  1033				}
  1034				key_put(opts->tls_key);
  1035				opts->tls_key = key;
  1036				break;
  1037			case NVMF_OPT_DISCOVERY:
  1038				opts->discovery_nqn = true;
  1039				break;
  1040			case NVMF_OPT_DHCHAP_SECRET:
  1041				p = match_strdup(args);
  1042				if (!p) {
  1043					ret = -ENOMEM;
  1044					goto out;
  1045				}
  1046				kfree(host_secret);
  1047				host_secret = p;
  1048				break;
  1049			case NVMF_OPT_DHCHAP_CTRL_SECRET:
  1050				p = match_strdup(args);
  1051				if (!p) {
  1052					ret = -ENOMEM;
  1053					goto out;
  1054				}
  1055				kfree(ctrl_secret);
  1056				ctrl_secret = p;
  1057				break;
  1058			case NVMF_OPT_TLS:
  1059				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
  1060					pr_err("TLS is not supported\n");
  1061					ret = -EINVAL;
  1062					goto out;
  1063				}
  1064				opts->tls = true;
  1065				break;
  1066			case NVMF_OPT_CONCAT:
  1067				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
  1068					pr_err("TLS is not supported\n");
  1069					ret = -EINVAL;
  1070					goto out;
  1071				}
  1072				opts->concat = true;
  1073				break;
  1074			default:
  1075				pr_warn("unknown parameter or missing value '%s' in ctrl creation request\n",
  1076					p);
  1077				ret = -EINVAL;
  1078				goto out;
  1079			}
  1080		}
  1081	
  1082		if (opts->discovery_nqn) {
  1083			opts->nr_io_queues = 0;
  1084			opts->nr_write_queues = 0;
  1085			opts->nr_poll_queues = 0;
  1086			opts->duplicate_connect = true;
  1087		} else {
  1088			if (!opts->kato)
  1089				opts->kato = NVME_DEFAULT_KATO;
  1090		}
  1091		if (ctrl_loss_tmo < 0) {
  1092			opts->max_reconnects = -1;
  1093		} else {
  1094			opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
  1095							opts->reconnect_delay);
  1096			if (ctrl_loss_tmo < opts->fast_io_fail_tmo)
  1097				pr_warn("failfast tmo (%d) larger than controller loss tmo (%d)\n",
  1098					opts->fast_io_fail_tmo, ctrl_loss_tmo);
  1099		}
  1100	
  1101		opts->host = nvmf_host_add(hostnqn, &hostid);
  1102		if (IS_ERR(opts->host)) {
  1103			ret = PTR_ERR(opts->host);
  1104			opts->host = NULL;
  1105			goto out;
  1106		}
  1107	
  1108		if (host_secret) {
  1109			pr_debug("lookup host identity '%s'\n", host_secret);
  1110			key = nvme_auth_extract_key(opts->keyring, host_secret,
  1111						    strlen(host_secret),
  1112						    &opts->dhchap_key_generated);
  1113			if (IS_ERR(key)) {
  1114				ret = PTR_ERR(key);
  1115				goto out;
  1116			}
  1117			pr_debug("using dhchap key %08x\n", key_serial(key));
  1118			opts->dhchap_key = key;
  1119		}
  1120		if (ctrl_secret) {
  1121			if (!opts->dhchap_key) {
  1122				ret = -EINVAL;
  1123				goto out;
  1124			}
  1125			pr_debug("lookup ctrl identity '%s'\n", ctrl_secret);
  1126			key = nvme_auth_extract_key(opts->keyring, ctrl_secret,
  1127						    strlen(ctrl_secret),
  1128						    &opts->dhchap_ctrl_key_generated);
  1129			if (IS_ERR(key)) {
  1130				ret = PTR_ERR(key);
  1131				goto out;
  1132			}
  1133			pr_debug("using dhchap ctrl key %08x\n", key_serial(key));
  1134			opts->dhchap_ctrl_key = key;
  1135		}
  1136	
  1137		if (opts->concat) {
  1138			if (opts->tls) {
  1139				pr_err("Secure concatenation over TLS is not supported\n");
  1140				ret = -EINVAL;
  1141				goto out;
  1142			}
  1143			if (opts->tls_key) {
  1144				pr_err("Cannot specify a TLS key for secure concatenation\n");
  1145				ret = -EINVAL;
  1146				goto out;
  1147			}
  1148			if (!opts->dhchap_key) {
  1149				pr_err("Need to enable DH-CHAP for secure concatenation\n");
  1150				ret = -EINVAL;
  1151				goto out;
  1152			}
  1153		}
  1154	
  1155	out:
  1156		kfree(ctrl_secret);
  1157		kfree(host_secret);
  1158		kfree(options);
  1159		return ret;
  1160	}
  1161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
