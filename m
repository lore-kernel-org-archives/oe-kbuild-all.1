Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8BA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 01:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691112661; x=1722648661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X653+qqA5589jUOIZVtzpweNmYZrb9WiHATfxoU1q+w=;
  b=RFgedlw7862oBsJp2Bl7Fhc09Hgv8Ize+o7V6uMss22k9I1m4hgST9Yt
   b3UtOs9c+W1Xqaidokq1+/BskbWVNDpRWZmM1j5BeBVURGztzbjZ/tOXN
   hlj6phlkc2d+rybL4w4psB7qItrIxZDgSek02LRGpBi2pC0t4jKt7mLRc
   OrJABg9T0rzuOrs4I+Cbt3gL+nrsD4lFYAHPufXNW7sQYnorgLfCSbUF7
   wG4VBFORyZNfilyDtayTRDBPDtJoptyAsPYfkcrBxccZEAaVyyLfpU5kp
   sHfJ7/Ftuc5yZbSxJE0RgYB1kGkmmsuYvX1URKg+BD/IwODdGUuoPhxMd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350341796"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="350341796"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 18:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819893425"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="819893425"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 18:30:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRjec-0002WF-1u;
	Fri, 04 Aug 2023 01:30:58 +0000
Date: Fri, 4 Aug 2023 09:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v8 10/15] drivers/nvme/host/fabrics.c:957:31: error:
 implicit declaration of function 'key_lookup'; did you mean 'vma_lookup'?
Message-ID: <202308040924.lZUqPHv3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v8
head:   fe5c5678d10ec3d17d9a29641bd64a4304f8abb7
commit: b142d4dee84915529de6918431fab982ec713a46 [10/15] nvme-fabrics: parse options 'keyring' and 'tls_key'
config: arc-randconfig-r043-20230802 (https://download.01.org/0day-ci/archive/20230804/202308040924.lZUqPHv3-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040924.lZUqPHv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040924.lZUqPHv3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/host/fabrics.c: In function 'nvmf_parse_options':
>> drivers/nvme/host/fabrics.c:957:31: error: implicit declaration of function 'key_lookup'; did you mean 'vma_lookup'? [-Werror=implicit-function-declaration]
     957 |                         key = key_lookup(key_id);
         |                               ^~~~~~~~~~
         |                               vma_lookup
>> drivers/nvme/host/fabrics.c:957:29: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     957 |                         key = key_lookup(key_id);
         |                             ^
   drivers/nvme/host/fabrics.c:987:29: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     987 |                         key = key_lookup(key_id);
         |                             ^
   cc1: some warnings being treated as errors


vim +957 drivers/nvme/host/fabrics.c

   659	
   660	static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
   661			const char *buf)
   662	{
   663		substring_t args[MAX_OPT_ARGS];
   664		char *options, *o, *p;
   665		int token, ret = 0;
   666		size_t nqnlen  = 0;
   667		int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
   668		uuid_t hostid;
   669		char hostnqn[NVMF_NQN_SIZE];
   670		struct key *key = NULL;
   671	
   672		/* Set defaults */
   673		opts->queue_size = NVMF_DEF_QUEUE_SIZE;
   674		opts->nr_io_queues = num_online_cpus();
   675		opts->reconnect_delay = NVMF_DEF_RECONNECT_DELAY;
   676		opts->kato = 0;
   677		opts->duplicate_connect = false;
   678		opts->fast_io_fail_tmo = NVMF_DEF_FAIL_FAST_TMO;
   679		opts->hdr_digest = false;
   680		opts->data_digest = false;
   681		opts->tos = -1; /* < 0 == use transport default */
   682		opts->tls = false;
   683	
   684		options = o = kstrdup(buf, GFP_KERNEL);
   685		if (!options)
   686			return -ENOMEM;
   687	
   688		/* use default host if not given by user space */
   689		uuid_copy(&hostid, &nvmf_default_host->id);
   690		strscpy(hostnqn, nvmf_default_host->nqn, NVMF_NQN_SIZE);
   691	
   692		while ((p = strsep(&o, ",\n")) != NULL) {
   693			if (!*p)
   694				continue;
   695	
   696			token = match_token(p, opt_tokens, args);
   697			opts->mask |= token;
   698			switch (token) {
   699			case NVMF_OPT_TRANSPORT:
   700				p = match_strdup(args);
   701				if (!p) {
   702					ret = -ENOMEM;
   703					goto out;
   704				}
   705				kfree(opts->transport);
   706				opts->transport = p;
   707				break;
   708			case NVMF_OPT_NQN:
   709				p = match_strdup(args);
   710				if (!p) {
   711					ret = -ENOMEM;
   712					goto out;
   713				}
   714				kfree(opts->subsysnqn);
   715				opts->subsysnqn = p;
   716				nqnlen = strlen(opts->subsysnqn);
   717				if (nqnlen >= NVMF_NQN_SIZE) {
   718					pr_err("%s needs to be < %d bytes\n",
   719						opts->subsysnqn, NVMF_NQN_SIZE);
   720					ret = -EINVAL;
   721					goto out;
   722				}
   723				opts->discovery_nqn =
   724					!(strcmp(opts->subsysnqn,
   725						 NVME_DISC_SUBSYS_NAME));
   726				break;
   727			case NVMF_OPT_TRADDR:
   728				p = match_strdup(args);
   729				if (!p) {
   730					ret = -ENOMEM;
   731					goto out;
   732				}
   733				kfree(opts->traddr);
   734				opts->traddr = p;
   735				break;
   736			case NVMF_OPT_TRSVCID:
   737				p = match_strdup(args);
   738				if (!p) {
   739					ret = -ENOMEM;
   740					goto out;
   741				}
   742				kfree(opts->trsvcid);
   743				opts->trsvcid = p;
   744				break;
   745			case NVMF_OPT_QUEUE_SIZE:
   746				if (match_int(args, &token)) {
   747					ret = -EINVAL;
   748					goto out;
   749				}
   750				if (token < NVMF_MIN_QUEUE_SIZE ||
   751				    token > NVMF_MAX_QUEUE_SIZE) {
   752					pr_err("Invalid queue_size %d\n", token);
   753					ret = -EINVAL;
   754					goto out;
   755				}
   756				opts->queue_size = token;
   757				break;
   758			case NVMF_OPT_NR_IO_QUEUES:
   759				if (match_int(args, &token)) {
   760					ret = -EINVAL;
   761					goto out;
   762				}
   763				if (token <= 0) {
   764					pr_err("Invalid number of IOQs %d\n", token);
   765					ret = -EINVAL;
   766					goto out;
   767				}
   768				if (opts->discovery_nqn) {
   769					pr_debug("Ignoring nr_io_queues value for discovery controller\n");
   770					break;
   771				}
   772	
   773				opts->nr_io_queues = min_t(unsigned int,
   774						num_online_cpus(), token);
   775				break;
   776			case NVMF_OPT_KATO:
   777				if (match_int(args, &token)) {
   778					ret = -EINVAL;
   779					goto out;
   780				}
   781	
   782				if (token < 0) {
   783					pr_err("Invalid keep_alive_tmo %d\n", token);
   784					ret = -EINVAL;
   785					goto out;
   786				} else if (token == 0 && !opts->discovery_nqn) {
   787					/* Allowed for debug */
   788					pr_warn("keep_alive_tmo 0 won't execute keep alives!!!\n");
   789				}
   790				opts->kato = token;
   791				break;
   792			case NVMF_OPT_CTRL_LOSS_TMO:
   793				if (match_int(args, &token)) {
   794					ret = -EINVAL;
   795					goto out;
   796				}
   797	
   798				if (token < 0)
   799					pr_warn("ctrl_loss_tmo < 0 will reconnect forever\n");
   800				ctrl_loss_tmo = token;
   801				break;
   802			case NVMF_OPT_FAIL_FAST_TMO:
   803				if (match_int(args, &token)) {
   804					ret = -EINVAL;
   805					goto out;
   806				}
   807	
   808				if (token >= 0)
   809					pr_warn("I/O fail on reconnect controller after %d sec\n",
   810						token);
   811				else
   812					token = -1;
   813	
   814				opts->fast_io_fail_tmo = token;
   815				break;
   816			case NVMF_OPT_HOSTNQN:
   817				if (opts->host) {
   818					pr_err("hostnqn already user-assigned: %s\n",
   819					       opts->host->nqn);
   820					ret = -EADDRINUSE;
   821					goto out;
   822				}
   823				p = match_strdup(args);
   824				if (!p) {
   825					ret = -ENOMEM;
   826					goto out;
   827				}
   828				nqnlen = strlen(p);
   829				if (nqnlen >= NVMF_NQN_SIZE) {
   830					pr_err("%s needs to be < %d bytes\n",
   831						p, NVMF_NQN_SIZE);
   832					kfree(p);
   833					ret = -EINVAL;
   834					goto out;
   835				}
   836				strscpy(hostnqn, p, NVMF_NQN_SIZE);
   837				kfree(p);
   838				break;
   839			case NVMF_OPT_RECONNECT_DELAY:
   840				if (match_int(args, &token)) {
   841					ret = -EINVAL;
   842					goto out;
   843				}
   844				if (token <= 0) {
   845					pr_err("Invalid reconnect_delay %d\n", token);
   846					ret = -EINVAL;
   847					goto out;
   848				}
   849				opts->reconnect_delay = token;
   850				break;
   851			case NVMF_OPT_HOST_TRADDR:
   852				p = match_strdup(args);
   853				if (!p) {
   854					ret = -ENOMEM;
   855					goto out;
   856				}
   857				kfree(opts->host_traddr);
   858				opts->host_traddr = p;
   859				break;
   860			case NVMF_OPT_HOST_IFACE:
   861				p = match_strdup(args);
   862				if (!p) {
   863					ret = -ENOMEM;
   864					goto out;
   865				}
   866				kfree(opts->host_iface);
   867				opts->host_iface = p;
   868				break;
   869			case NVMF_OPT_HOST_ID:
   870				p = match_strdup(args);
   871				if (!p) {
   872					ret = -ENOMEM;
   873					goto out;
   874				}
   875				ret = uuid_parse(p, &hostid);
   876				if (ret) {
   877					pr_err("Invalid hostid %s\n", p);
   878					ret = -EINVAL;
   879					kfree(p);
   880					goto out;
   881				}
   882				kfree(p);
   883				break;
   884			case NVMF_OPT_DUP_CONNECT:
   885				opts->duplicate_connect = true;
   886				break;
   887			case NVMF_OPT_DISABLE_SQFLOW:
   888				opts->disable_sqflow = true;
   889				break;
   890			case NVMF_OPT_HDR_DIGEST:
   891				opts->hdr_digest = true;
   892				break;
   893			case NVMF_OPT_DATA_DIGEST:
   894				opts->data_digest = true;
   895				break;
   896			case NVMF_OPT_NR_WRITE_QUEUES:
   897				if (match_int(args, &token)) {
   898					ret = -EINVAL;
   899					goto out;
   900				}
   901				if (token <= 0) {
   902					pr_err("Invalid nr_write_queues %d\n", token);
   903					ret = -EINVAL;
   904					goto out;
   905				}
   906				opts->nr_write_queues = token;
   907				break;
   908			case NVMF_OPT_NR_POLL_QUEUES:
   909				if (match_int(args, &token)) {
   910					ret = -EINVAL;
   911					goto out;
   912				}
   913				if (token <= 0) {
   914					pr_err("Invalid nr_poll_queues %d\n", token);
   915					ret = -EINVAL;
   916					goto out;
   917				}
   918				opts->nr_poll_queues = token;
   919				break;
   920			case NVMF_OPT_TOS:
   921				if (match_int(args, &token)) {
   922					ret = -EINVAL;
   923					goto out;
   924				}
   925				if (token < 0) {
   926					pr_err("Invalid type of service %d\n", token);
   927					ret = -EINVAL;
   928					goto out;
   929				}
   930				if (token > 255) {
   931					pr_warn("Clamping type of service to 255\n");
   932					token = 255;
   933				}
   934				opts->tos = token;
   935				break;
   936			case NVMF_OPT_KEYRING:
   937				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
   938					pr_err("TLS is not supported\n");
   939					ret = -EINVAL;
   940					goto out;
   941				}
   942				if (match_int(args, &key_id)) {
   943					ret = -EINVAL;
   944					goto out;
   945				}
   946				if (key_id < 0) {
   947					pr_err("Invalid keyring id %d\n", key_id);
   948					ret = -EINVAL;
   949					goto out;
   950				}
   951				if (!key_id) {
   952					pr_debug("Using default keyring\n");
   953					key_put(opts->keyring);
   954					opts->keyring = NULL;
   955					break;
   956				}
 > 957				key = key_lookup(key_id);
   958				if (!key) {
   959					pr_err("Keyring id %08x not found\n", key_id);
   960					ret = -ENOKEY;
   961					goto out;
   962				}
   963				key_put(opts->keyring);
   964				opts->keyring = key;
   965				break;
   966			case NVMF_OPT_TLS_KEY:
   967				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
   968					pr_err("TLS is not supported\n");
   969					ret = -EINVAL;
   970					goto out;
   971				}
   972				if (match_int(args, &key_id)) {
   973					ret = -EINVAL;
   974					goto out;
   975				}
   976				if (key_id < 0) {
   977					pr_err("Invalid key id %d\n", key_id);
   978					ret = -EINVAL;
   979					goto out;
   980				}
   981				if (!key_id) {
   982					pr_debug("Using 'best' PSK\n");
   983					key_put(opts->tls_key);
   984					opts->tls_key = NULL;
   985					break;
   986				}
   987				key = key_lookup(key_id);
   988				if (!key) {
   989					pr_err("Key id %08x not found\n", key_id);
   990					ret = -ENOKEY;
   991					goto out;
   992				}
   993				key_put(opts->tls_key);
   994				opts->tls_key = key;
   995				break;
   996			case NVMF_OPT_DISCOVERY:
   997				opts->discovery_nqn = true;
   998				break;
   999			case NVMF_OPT_DHCHAP_SECRET:
  1000				p = match_strdup(args);
  1001				if (!p) {
  1002					ret = -ENOMEM;
  1003					goto out;
  1004				}
  1005				if (strlen(p) < 11 || strncmp(p, "DHHC-1:", 7)) {
  1006					pr_err("Invalid DH-CHAP secret %s\n", p);
  1007					ret = -EINVAL;
  1008					goto out;
  1009				}
  1010				kfree(opts->dhchap_secret);
  1011				opts->dhchap_secret = p;
  1012				break;
  1013			case NVMF_OPT_DHCHAP_CTRL_SECRET:
  1014				p = match_strdup(args);
  1015				if (!p) {
  1016					ret = -ENOMEM;
  1017					goto out;
  1018				}
  1019				if (strlen(p) < 11 || strncmp(p, "DHHC-1:", 7)) {
  1020					pr_err("Invalid DH-CHAP secret %s\n", p);
  1021					ret = -EINVAL;
  1022					goto out;
  1023				}
  1024				kfree(opts->dhchap_ctrl_secret);
  1025				opts->dhchap_ctrl_secret = p;
  1026				break;
  1027			case NVMF_OPT_TLS:
  1028				if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
  1029					pr_err("TLS is not supported\n");
  1030					ret = -EINVAL;
  1031					goto out;
  1032				}
  1033				opts->tls = true;
  1034				break;
  1035			default:
  1036				pr_warn("unknown parameter or missing value '%s' in ctrl creation request\n",
  1037					p);
  1038				ret = -EINVAL;
  1039				goto out;
  1040			}
  1041		}
  1042	
  1043		if (opts->discovery_nqn) {
  1044			opts->nr_io_queues = 0;
  1045			opts->nr_write_queues = 0;
  1046			opts->nr_poll_queues = 0;
  1047			opts->duplicate_connect = true;
  1048		} else {
  1049			if (!opts->kato)
  1050				opts->kato = NVME_DEFAULT_KATO;
  1051		}
  1052		if (ctrl_loss_tmo < 0) {
  1053			opts->max_reconnects = -1;
  1054		} else {
  1055			opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
  1056							opts->reconnect_delay);
  1057			if (ctrl_loss_tmo < opts->fast_io_fail_tmo)
  1058				pr_warn("failfast tmo (%d) larger than controller loss tmo (%d)\n",
  1059					opts->fast_io_fail_tmo, ctrl_loss_tmo);
  1060		}
  1061	
  1062		opts->host = nvmf_host_add(hostnqn, &hostid);
  1063		if (IS_ERR(opts->host)) {
  1064			ret = PTR_ERR(opts->host);
  1065			opts->host = NULL;
  1066			goto out;
  1067		}
  1068	
  1069	out:
  1070		kfree(options);
  1071		return ret;
  1072	}
  1073	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
