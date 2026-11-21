Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795234674;
	b=yoHahcvFNTQV9O8YXobo/ua3OW7DdjIY0ovMFdXPUPkcWj4YT0QpO0CMI5YOf3pByyoC
	 /fTepJhmRcHPblnO/ZQ9wj1g/6bVZGgEEYIlCm2EoPufhUOhocyltmCFkWSsNBxcQ6Aba
	 bGtdMANw/3E0hkqjPv+//AYN6JtugaVvwgq4PUZO3PilQkJPJiUI7KckjYO2fBSgvnFZO
	 msoRstBKRm1XdvsQaFL70rRX0l3rlZlk3dTjjgSRpNvLV/pYbefjOkvS6TxUBPZRSnCTx
	 NnNmXyGlYH7U7dNwc3XnwfksSuzyVkrSLcL8Sy1jjaGgyROJqRJDMLYcRtDv21qrt7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795234674;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YDV89ja6Ho3TxlmxejmTvO5B5zXqvwev7BUim6ss2bI=;
	b=YiSAjyPGRnbzYWhTqXe2w79EHjC51vDXhLKkEzsX7CfKx8BmJ1lioAAepWjHfSTEN3y/
	 ruyJZc6tbFzg2bNf6UmlQmPRnen1+mPPCRDrVg223GuABYbFPogAfXjJgAqSJqNyQxJvh
	 RaS+3hC3Ij40R5H5uvfTreuPVpy7xjDRV5xp4PR7TLPCW14rrxU9gdnj0XJ7eHk+2dYtQ
	 n9wLq4OYst8IUos93egszqpsGXgv+Z725e+cWuc15L0dKY+odoDSj5Pg3O7JyCyXtKNSe
	 ch4s2lDy5EE8dqRE9lMjkZ+aImZ6dPNd4GfMvPeYolOngRu/22TGGaC4b6xn6sLKQ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lW5E+iy9;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A22606A6A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 04:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A22606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lW5E+iy9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795234668; x=1826770668;
  h=date:from:to:cc:subject:message-id;
  bh=IxNvRVkbXAag2jvt/FhVgVZXIqsLWHqkrrxZQMl1fTY=;
  b=lW5E+iy9KGrJ3nO5KFRZBZTtq3+DWPf4KXubke6ISCh4HwM7rfhSM/M7
   cHQq18mfUJey67TYAqSh/tDXvuem0+yRv2KU97ujhzBOxbLNgJOlayk3k
   +haW/LgaIu4HQ6Fo9tDAWlYkzOSOc1O56DMaIFyGZkROg0/vDB0mE8ZKs
   yKT7fYmVe7PR9++FWk2oY7F4dORtneP9NpEPTPoZ06KURcTqvJie4tGON
   2MdlBh6hNB5Y4FhwEkgowcLDOp2jsC6OMaqsaVvexDSz6YSXlv0CQe8QR
   ZipTsW0zBjz98h3PeyFe1jjgFQRqg1wdzd3YPMDEMe3CsXzTjV7e2T1tv
   Q==;
X-CSE-ConnectionGUID: rMQtSsE/R5KkDdzO/M5fDw==
X-CSE-MsgGUID: SX7W6JLrRbmwOmAGfBR6mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4200331"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4200331"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 20:17:47 -0800
X-CSE-ConnectionGUID: WVQvKjCDRkiiCqwPy7kH5w==
X-CSE-MsgGUID: qSliTcmqQQOx8bAe6S8PTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11175753"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 20:17:46 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUcXn-000000004ET-2hU9;
	Sat, 21 Nov 2026 04:17:43 +0000
Date: Sat, 21 Nov 2026 05:17:12 +0100
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v4 8/9]
 drivers/nvme/host/fabrics.c:1002:11: error: call to undeclared function
 'request_key'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20261121051508.ymKlm8nk-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v4
head:   1b78746d90bfa570d96e88475983421f24c38b0d
commit: 435f6c1e0f0973b5466f2e7fb753093311865757 [8/9] nvme-fabrics: allow to pass in keyring by name
config: powerpc64-randconfig-r2307-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121051508.ymKlm8nk-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121051508.ymKlm8nk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121051508.ymKlm8nk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvme/host/fabrics.c:16:
   include/linux/nvme-keyring.h:54:1: error: expected identifier or '('
      54 | {
         | ^
   include/linux/nvme-keyring.h:57:4: warning: no previous prototype for function 'nvme_dhchap_psk_hash' [-Wmissing-prototypes]
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         |    ^
   include/linux/nvme-keyring.h:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | u8 nvme_dhchap_psk_hash(struct key *key)
         | ^
         | static 
>> drivers/nvme/host/fabrics.c:1002:11: error: call to undeclared function 'request_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1002 |                                 key = request_key(&key_type_keyring, p, NULL);
         |                                       ^
>> drivers/nvme/host/fabrics.c:1002:24: error: use of undeclared identifier 'key_type_keyring'
    1002 |                                 key = request_key(&key_type_keyring, p, NULL);
         |                                                    ^~~~~~~~~~~~~~~~
   1 warning and 3 errors generated.


vim +/request_key +1002 drivers/nvme/host/fabrics.c

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
   882				p = match_strdup(args);
   883				if (!p) {
   884					ret = -ENOMEM;
   885					goto out;
   886				}
   887				nqnlen = strlen(p);
   888				if (nqnlen >= NVMF_NQN_SIZE) {
   889					pr_err("%s needs to be < %d bytes\n",
   890						p, NVMF_NQN_SIZE);
   891					kfree(p);
   892					ret = -EINVAL;
   893					goto out;
   894				}
   895				strscpy(hostnqn, p, NVMF_NQN_SIZE);
   896				kfree(p);
   897				break;
   898			case NVMF_OPT_RECONNECT_DELAY:
   899				if (match_int(args, &token)) {
   900					ret = -EINVAL;
   901					goto out;
   902				}
   903				if (token <= 0) {
   904					pr_err("Invalid reconnect_delay %d\n", token);
   905					ret = -EINVAL;
   906					goto out;
   907				}
   908				opts->reconnect_delay = token;
   909				break;
   910			case NVMF_OPT_HOST_TRADDR:
   911				p = match_strdup(args);
   912				if (!p) {
   913					ret = -ENOMEM;
   914					goto out;
   915				}
   916				kfree(opts->host_traddr);
   917				opts->host_traddr = p;
   918				break;
   919			case NVMF_OPT_HOST_IFACE:
   920				p = match_strdup(args);
   921				if (!p) {
   922					ret = -ENOMEM;
   923					goto out;
   924				}
   925				kfree(opts->host_iface);
   926				opts->host_iface = p;
   927				break;
   928			case NVMF_OPT_HOST_ID:
   929				p = match_strdup(args);
   930				if (!p) {
   931					ret = -ENOMEM;
   932					goto out;
   933				}
   934				ret = uuid_parse(p, &hostid);
   935				if (ret) {
   936					pr_err("Invalid hostid %s\n", p);
   937					ret = -EINVAL;
   938					kfree(p);
   939					goto out;
   940				}
   941				kfree(p);
   942				break;
   943			case NVMF_OPT_DUP_CONNECT:
   944				opts->duplicate_connect = true;
   945				break;
   946			case NVMF_OPT_DISABLE_SQFLOW:
   947				opts->disable_sqflow = true;
   948				break;
   949			case NVMF_OPT_HDR_DIGEST:
   950				opts->hdr_digest = true;
   951				break;
   952			case NVMF_OPT_DATA_DIGEST:
   953				opts->data_digest = true;
   954				break;
   955			case NVMF_OPT_NR_WRITE_QUEUES:
   956				if (match_int(args, &token)) {
   957					ret = -EINVAL;
   958					goto out;
   959				}
   960				if (token <= 0) {
   961					pr_err("Invalid nr_write_queues %d\n", token);
   962					ret = -EINVAL;
   963					goto out;
   964				}
   965				opts->nr_write_queues = token;
   966				break;
   967			case NVMF_OPT_NR_POLL_QUEUES:
   968				if (match_int(args, &token)) {
   969					ret = -EINVAL;
   970					goto out;
   971				}
   972				if (token <= 0) {
   973					pr_err("Invalid nr_poll_queues %d\n", token);
   974					ret = -EINVAL;
   975					goto out;
   976				}
   977				opts->nr_poll_queues = token;
   978				break;
   979			case NVMF_OPT_TOS:
   980				if (match_int(args, &token)) {
   981					ret = -EINVAL;
   982					goto out;
   983				}
   984				if (token < 0) {
   985					pr_err("Invalid type of service %d\n", token);
   986					ret = -EINVAL;
   987					goto out;
   988				}
   989				if (token > 255) {
   990					pr_warn("Clamping type of service to 255\n");
   991					token = 255;
   992				}
   993				opts->tos = token;
   994				break;
   995			case NVMF_OPT_KEYRING:
   996				if (match_int(args, &key_id) || key_id <= 0) {
   997					p = match_strdup(args);
   998					if (!p) {
   999						ret = -ENOMEM;
  1000						goto out;
  1001					}
> 1002					key = request_key(&key_type_keyring, p, NULL);
  1003					kfree(p);
  1004					if (IS_ERR(key)) {
  1005						ret = PTR_ERR(key);
  1006						goto out;
  1007					}
  1008				} else {
  1009					key = nvmf_parse_key(key_id);
  1010					if (IS_ERR(key)) {
  1011						ret = PTR_ERR(key);
  1012						goto out;
  1013					}
  1014				}
  1015				key_put(opts->keyring);
  1016				opts->keyring = key;
  1017				break;
  1018			case NVMF_OPT_TLS_KEY:
  1019				if (match_int(args, &key_id) || key_id <= 0) {
  1020					ret = -EINVAL;
  1021					goto out;
  1022				}
  1023				key = nvmf_parse_key(key_id);
  1024				if (IS_ERR(key)) {
  1025					ret = PTR_ERR(key);
  1026					goto out;
  1027				}
  1028				key_put(opts->tls_key);
  1029				opts->tls_key = key;
  1030				break;
  1031			case NVMF_OPT_DISCOVERY:
  1032				opts->discovery_nqn = true;
  1033				break;
  1034			case NVMF_OPT_DHCHAP_SECRET:
  1035				p = match_strdup(args);
  1036				if (!p) {
  1037					ret = -ENOMEM;
  1038					goto out;
  1039				}
  1040				kfree_sensitive(host_secret);
  1041				host_secret = p;
  1042				break;
  1043			case NVMF_OPT_DHCHAP_CTRL_SECRET:
  1044				p = match_strdup(args);
  1045				if (!p) {
  1046					ret = -ENOMEM;
  1047					goto out;
  1048				}
  1049				kfree_sensitive(ctrl_secret);
  1050				ctrl_secret = p;
  1051				break;
  1052			case NVMF_OPT_TLS:
  1053				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
  1054					pr_err("TLS is not supported\n");
  1055					ret = -EINVAL;
  1056					goto out;
  1057				}
  1058				opts->tls = true;
  1059				break;
  1060			case NVMF_OPT_CONCAT:
  1061				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
  1062					pr_err("TLS is not supported\n");
  1063					ret = -EINVAL;
  1064					goto out;
  1065				}
  1066				opts->concat = true;
  1067				break;
  1068			default:
  1069				pr_warn("unknown parameter or missing value '%s' in ctrl creation request\n",
  1070					p);
  1071				ret = -EINVAL;
  1072				goto out;
  1073			}
  1074		}
  1075	
  1076		if (opts->discovery_nqn) {
  1077			opts->nr_io_queues = 0;
  1078			opts->nr_write_queues = 0;
  1079			opts->nr_poll_queues = 0;
  1080			opts->duplicate_connect = true;
  1081		} else {
  1082			if (!opts->kato)
  1083				opts->kato = NVME_DEFAULT_KATO;
  1084		}
  1085		if (ctrl_loss_tmo < 0) {
  1086			opts->max_reconnects = -1;
  1087		} else {
  1088			opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
  1089							opts->reconnect_delay);
  1090			if (ctrl_loss_tmo < opts->fast_io_fail_tmo)
  1091				pr_warn("failfast tmo (%d) larger than controller loss tmo (%d)\n",
  1092					opts->fast_io_fail_tmo, ctrl_loss_tmo);
  1093		}
  1094	
  1095		opts->host = nvmf_host_add(hostnqn, &hostid);
  1096		if (IS_ERR(opts->host)) {
  1097			ret = PTR_ERR(opts->host);
  1098			opts->host = NULL;
  1099			goto out;
  1100		}
  1101	
  1102		if (host_secret) {
  1103			pr_debug("lookup host identity '%s'\n", host_secret);
  1104			key = nvme_auth_extract_key(opts->keyring, host_secret,
  1105						    strlen(host_secret),
  1106						    &opts->dhchap_key_generated);
  1107			if (IS_ERR(key)) {
  1108				ret = PTR_ERR(key);
  1109				goto out;
  1110			}
  1111			pr_debug("using dhchap host key %08x\n", key_serial(key));
  1112			opts->dhchap_key = key;
  1113		}
  1114		if (ctrl_secret) {
  1115			if (!opts->dhchap_key) {
  1116				ret = -EINVAL;
  1117				goto out;
  1118			}
  1119			pr_debug("lookup ctrl identity '%s'\n", ctrl_secret);
  1120			key = nvme_auth_extract_key(opts->keyring, ctrl_secret,
  1121						    strlen(ctrl_secret),
  1122						    &opts->dhchap_ctrl_key_generated);
  1123			if (IS_ERR(key)) {
  1124				ret = PTR_ERR(key);
  1125				goto out;
  1126			}
  1127			pr_debug("using dhchap ctrl key %08x\n", key_serial(key));
  1128			opts->dhchap_ctrl_key = key;
  1129		}
  1130	
  1131		if (opts->concat) {
  1132			if (opts->tls) {
  1133				pr_err("Secure concatenation over TLS is not supported\n");
  1134				ret = -EINVAL;
  1135				goto out;
  1136			}
  1137			if (opts->tls_key) {
  1138				pr_err("Cannot specify a TLS key for secure concatenation\n");
  1139				ret = -EINVAL;
  1140				goto out;
  1141			}
  1142			if (!opts->dhchap_key) {
  1143				pr_err("Need to enable DH-CHAP for secure concatenation\n");
  1144				ret = -EINVAL;
  1145				goto out;
  1146			}
  1147		}
  1148	
  1149	out:
  1150		kfree_sensitive(ctrl_secret);
  1151		kfree_sensitive(host_secret);
  1152		kfree(options);
  1153		return ret;
  1154	}
  1155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
