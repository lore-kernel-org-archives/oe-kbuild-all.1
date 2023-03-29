Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC20B748E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680118815; x=1711654815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7tiyyXhw9wLWOtinv2V8RSdGG3XQyCKjlSw5RF+TZo=;
  b=nL22USNRexL32u9l8GPaqQzPbqLWVXgvGnB27g/SjyZf+QC6tn62lT41
   jahpKf4l7chcorUXoBJK5eZpQqGGrkD4s/6HGeX8vItm/4+6Nl8xUlyp7
   E6cH93sGONY/MM+kwzJo5B3y4GVo0/4Z99xMG6IF9dOss89nuI4JlmWWK
   8IgrNqIyAPtZZE530a+6gkIJIRGDf/pKYNpQ2xSx5ZPr4CKsfKIDztV0F
   KJ8TrXGjaRj5w4QwvY/lXe24ggNozZN7YkLh1R2oArdk9huX9qj4ZVSp8
   98BtwIDdvXLY5cIE385COaL7xgpSKWTK4s+bdlobO5/0u1S+7Q74ptKrB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343430127"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="343430127"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 12:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677905147"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="677905147"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Mar 2023 12:40:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phbeU-000Jsz-0r;
	Wed, 29 Mar 2023 19:40:10 +0000
Date: Thu, 30 Mar 2023 03:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v8 14/20]
 drivers/nvme/host/fabrics.c:627:21: warning: unused variable 'key'
Message-ID: <202303300303.Ulj2yDJq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v8
head:   b160cccb84362674ac09fb349ab21bd2339eb28e
commit: 3d86ae6457eb3852d3b958c149a9b4309b483763 [14/20] nvme-fabrics: parse options 'keyring' and 'tls_key'
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230330/202303300303.Ulj2yDJq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=3d86ae6457eb3852d3b958c149a9b4309b483763
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v8
        git checkout 3d86ae6457eb3852d3b958c149a9b4309b483763
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/ io_uring/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300303.Ulj2yDJq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/fabrics.c: In function 'nvmf_parse_options':
>> drivers/nvme/host/fabrics.c:627:21: warning: unused variable 'key' [-Wunused-variable]
     627 |         struct key *key = NULL;
         |                     ^~~
>> drivers/nvme/host/fabrics.c:625:53: warning: unused variable 'key_id' [-Wunused-variable]
     625 |         int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
         |                                                     ^~~~~~


vim +/key +627 drivers/nvme/host/fabrics.c

   617	
   618	static int nvmf_parse_options(struct nvmf_ctrl_options *opts,
   619			const char *buf)
   620	{
   621		substring_t args[MAX_OPT_ARGS];
   622		char *options, *o, *p;
   623		int token, ret = 0;
   624		size_t nqnlen  = 0;
 > 625		int ctrl_loss_tmo = NVMF_DEF_CTRL_LOSS_TMO, key_id;
   626		uuid_t hostid;
 > 627		struct key *key = NULL;
   628	
   629		/* Set defaults */
   630		opts->queue_size = NVMF_DEF_QUEUE_SIZE;
   631		opts->nr_io_queues = num_online_cpus();
   632		opts->reconnect_delay = NVMF_DEF_RECONNECT_DELAY;
   633		opts->kato = 0;
   634		opts->duplicate_connect = false;
   635		opts->fast_io_fail_tmo = NVMF_DEF_FAIL_FAST_TMO;
   636		opts->hdr_digest = false;
   637		opts->data_digest = false;
   638		opts->tos = -1; /* < 0 == use transport default */
   639		opts->tls = false;
   640	
   641		options = o = kstrdup(buf, GFP_KERNEL);
   642		if (!options)
   643			return -ENOMEM;
   644	
   645		uuid_gen(&hostid);
   646	
   647		while ((p = strsep(&o, ",\n")) != NULL) {
   648			if (!*p)
   649				continue;
   650	
   651			token = match_token(p, opt_tokens, args);
   652			opts->mask |= token;
   653			switch (token) {
   654			case NVMF_OPT_TRANSPORT:
   655				p = match_strdup(args);
   656				if (!p) {
   657					ret = -ENOMEM;
   658					goto out;
   659				}
   660				kfree(opts->transport);
   661				opts->transport = p;
   662				break;
   663			case NVMF_OPT_NQN:
   664				p = match_strdup(args);
   665				if (!p) {
   666					ret = -ENOMEM;
   667					goto out;
   668				}
   669				kfree(opts->subsysnqn);
   670				opts->subsysnqn = p;
   671				nqnlen = strlen(opts->subsysnqn);
   672				if (nqnlen >= NVMF_NQN_SIZE) {
   673					pr_err("%s needs to be < %d bytes\n",
   674						opts->subsysnqn, NVMF_NQN_SIZE);
   675					ret = -EINVAL;
   676					goto out;
   677				}
   678				opts->discovery_nqn =
   679					!(strcmp(opts->subsysnqn,
   680						 NVME_DISC_SUBSYS_NAME));
   681				break;
   682			case NVMF_OPT_TRADDR:
   683				p = match_strdup(args);
   684				if (!p) {
   685					ret = -ENOMEM;
   686					goto out;
   687				}
   688				kfree(opts->traddr);
   689				opts->traddr = p;
   690				break;
   691			case NVMF_OPT_TRSVCID:
   692				p = match_strdup(args);
   693				if (!p) {
   694					ret = -ENOMEM;
   695					goto out;
   696				}
   697				kfree(opts->trsvcid);
   698				opts->trsvcid = p;
   699				break;
   700			case NVMF_OPT_QUEUE_SIZE:
   701				if (match_int(args, &token)) {
   702					ret = -EINVAL;
   703					goto out;
   704				}
   705				if (token < NVMF_MIN_QUEUE_SIZE ||
   706				    token > NVMF_MAX_QUEUE_SIZE) {
   707					pr_err("Invalid queue_size %d\n", token);
   708					ret = -EINVAL;
   709					goto out;
   710				}
   711				opts->queue_size = token;
   712				break;
   713			case NVMF_OPT_NR_IO_QUEUES:
   714				if (match_int(args, &token)) {
   715					ret = -EINVAL;
   716					goto out;
   717				}
   718				if (token <= 0) {
   719					pr_err("Invalid number of IOQs %d\n", token);
   720					ret = -EINVAL;
   721					goto out;
   722				}
   723				if (opts->discovery_nqn) {
   724					pr_debug("Ignoring nr_io_queues value for discovery controller\n");
   725					break;
   726				}
   727	
   728				opts->nr_io_queues = min_t(unsigned int,
   729						num_online_cpus(), token);
   730				break;
   731			case NVMF_OPT_KATO:
   732				if (match_int(args, &token)) {
   733					ret = -EINVAL;
   734					goto out;
   735				}
   736	
   737				if (token < 0) {
   738					pr_err("Invalid keep_alive_tmo %d\n", token);
   739					ret = -EINVAL;
   740					goto out;
   741				} else if (token == 0 && !opts->discovery_nqn) {
   742					/* Allowed for debug */
   743					pr_warn("keep_alive_tmo 0 won't execute keep alives!!!\n");
   744				}
   745				opts->kato = token;
   746				break;
   747			case NVMF_OPT_CTRL_LOSS_TMO:
   748				if (match_int(args, &token)) {
   749					ret = -EINVAL;
   750					goto out;
   751				}
   752	
   753				if (token < 0)
   754					pr_warn("ctrl_loss_tmo < 0 will reconnect forever\n");
   755				ctrl_loss_tmo = token;
   756				break;
   757			case NVMF_OPT_FAIL_FAST_TMO:
   758				if (match_int(args, &token)) {
   759					ret = -EINVAL;
   760					goto out;
   761				}
   762	
   763				if (token >= 0)
   764					pr_warn("I/O fail on reconnect controller after %d sec\n",
   765						token);
   766				else
   767					token = -1;
   768	
   769				opts->fast_io_fail_tmo = token;
   770				break;
   771			case NVMF_OPT_HOSTNQN:
   772				if (opts->host) {
   773					pr_err("hostnqn already user-assigned: %s\n",
   774					       opts->host->nqn);
   775					ret = -EADDRINUSE;
   776					goto out;
   777				}
   778				p = match_strdup(args);
   779				if (!p) {
   780					ret = -ENOMEM;
   781					goto out;
   782				}
   783				nqnlen = strlen(p);
   784				if (nqnlen >= NVMF_NQN_SIZE) {
   785					pr_err("%s needs to be < %d bytes\n",
   786						p, NVMF_NQN_SIZE);
   787					kfree(p);
   788					ret = -EINVAL;
   789					goto out;
   790				}
   791				opts->host = nvmf_host_add(p);
   792				kfree(p);
   793				if (!opts->host) {
   794					ret = -ENOMEM;
   795					goto out;
   796				}
   797				break;
   798			case NVMF_OPT_RECONNECT_DELAY:
   799				if (match_int(args, &token)) {
   800					ret = -EINVAL;
   801					goto out;
   802				}
   803				if (token <= 0) {
   804					pr_err("Invalid reconnect_delay %d\n", token);
   805					ret = -EINVAL;
   806					goto out;
   807				}
   808				opts->reconnect_delay = token;
   809				break;
   810			case NVMF_OPT_HOST_TRADDR:
   811				p = match_strdup(args);
   812				if (!p) {
   813					ret = -ENOMEM;
   814					goto out;
   815				}
   816				kfree(opts->host_traddr);
   817				opts->host_traddr = p;
   818				break;
   819			case NVMF_OPT_HOST_IFACE:
   820				p = match_strdup(args);
   821				if (!p) {
   822					ret = -ENOMEM;
   823					goto out;
   824				}
   825				kfree(opts->host_iface);
   826				opts->host_iface = p;
   827				break;
   828			case NVMF_OPT_HOST_ID:
   829				p = match_strdup(args);
   830				if (!p) {
   831					ret = -ENOMEM;
   832					goto out;
   833				}
   834				ret = uuid_parse(p, &hostid);
   835				if (ret) {
   836					pr_err("Invalid hostid %s\n", p);
   837					ret = -EINVAL;
   838					kfree(p);
   839					goto out;
   840				}
   841				kfree(p);
   842				break;
   843			case NVMF_OPT_DUP_CONNECT:
   844				opts->duplicate_connect = true;
   845				break;
   846			case NVMF_OPT_DISABLE_SQFLOW:
   847				opts->disable_sqflow = true;
   848				break;
   849			case NVMF_OPT_HDR_DIGEST:
   850				opts->hdr_digest = true;
   851				break;
   852			case NVMF_OPT_DATA_DIGEST:
   853				opts->data_digest = true;
   854				break;
   855			case NVMF_OPT_NR_WRITE_QUEUES:
   856				if (match_int(args, &token)) {
   857					ret = -EINVAL;
   858					goto out;
   859				}
   860				if (token <= 0) {
   861					pr_err("Invalid nr_write_queues %d\n", token);
   862					ret = -EINVAL;
   863					goto out;
   864				}
   865				opts->nr_write_queues = token;
   866				break;
   867			case NVMF_OPT_NR_POLL_QUEUES:
   868				if (match_int(args, &token)) {
   869					ret = -EINVAL;
   870					goto out;
   871				}
   872				if (token <= 0) {
   873					pr_err("Invalid nr_poll_queues %d\n", token);
   874					ret = -EINVAL;
   875					goto out;
   876				}
   877				opts->nr_poll_queues = token;
   878				break;
   879			case NVMF_OPT_TOS:
   880				if (match_int(args, &token)) {
   881					ret = -EINVAL;
   882					goto out;
   883				}
   884				if (token < 0) {
   885					pr_err("Invalid type of service %d\n", token);
   886					ret = -EINVAL;
   887					goto out;
   888				}
   889				if (token > 255) {
   890					pr_warn("Clamping type of service to 255\n");
   891					token = 255;
   892				}
   893				opts->tos = token;
   894				break;
   895			case NVMF_OPT_KEYRING:
   896	#ifdef CONFIG_NVME_TLS
   897				if (match_int(args, &key_id)) {
   898					ret = -EINVAL;
   899					goto out;
   900				}
   901				if (key_id < 0) {
   902					pr_err("Invalid keyring id %d\n", key_id);
   903					ret = -EINVAL;
   904					goto out;
   905				}
   906				if (!key_id) {
   907					pr_debug("Using default keyring\n");
   908					if (opts->keyring) {
   909						key_put(opts->keyring);
   910						opts->keyring = NULL;
   911					}
   912					break;
   913				}
   914				key = key_lookup(key_id);
   915				if (!key) {
   916					pr_err("Keyring id %08x not found\n", key_id);
   917					ret = -ENOKEY;
   918					goto out;
   919				}
   920				if (opts->keyring)
   921					key_put(opts->keyring);
   922				opts->keyring = key;
   923				break;
   924	#else
   925				pr_err("TLS is not supported\n");
   926				ret = -EINVAL;
   927				goto out;
   928	#endif
   929			case NVMF_OPT_TLS_KEY:
   930	#ifdef CONFIG_NVME_TLS
   931				if (match_int(args, &key_id)) {
   932					ret = -EINVAL;
   933					goto out;
   934				}
   935				if (key_id < 0) {
   936					pr_err("Invalid key id %d\n", key_id);
   937					ret = -EINVAL;
   938					goto out;
   939				}
   940				if (!key_id) {
   941					pr_debug("Using 'best' PSK\n");
   942					if (opts->tls_key) {
   943						key_put(opts->tls_key);
   944						opts->tls_key = NULL;
   945					}
   946					break;
   947				}
   948				key = key_lookup(key_id);
   949				if (!key) {
   950					pr_err("Key id %08x not found\n", key_id);
   951					ret = -ENOKEY;
   952					goto out;
   953				}
   954				if (opts->tls_key)
   955					key_put(opts->tls_key);
   956				opts->tls_key = key;
   957	#else
   958				pr_err("TLS is not supported\n");
   959				ret = -EINVAL;
   960				goto out;
   961	#endif
   962				break;
   963			case NVMF_OPT_DISCOVERY:
   964				opts->discovery_nqn = true;
   965				break;
   966			case NVMF_OPT_DHCHAP_SECRET:
   967				p = match_strdup(args);
   968				if (!p) {
   969					ret = -ENOMEM;
   970					goto out;
   971				}
   972				if (strlen(p) < 11 || strncmp(p, "DHHC-1:", 7)) {
   973					pr_err("Invalid DH-CHAP secret %s\n", p);
   974					ret = -EINVAL;
   975					goto out;
   976				}
   977				kfree(opts->dhchap_secret);
   978				opts->dhchap_secret = p;
   979				break;
   980			case NVMF_OPT_DHCHAP_CTRL_SECRET:
   981				p = match_strdup(args);
   982				if (!p) {
   983					ret = -ENOMEM;
   984					goto out;
   985				}
   986				if (strlen(p) < 11 || strncmp(p, "DHHC-1:", 7)) {
   987					pr_err("Invalid DH-CHAP secret %s\n", p);
   988					ret = -EINVAL;
   989					goto out;
   990				}
   991				kfree(opts->dhchap_ctrl_secret);
   992				opts->dhchap_ctrl_secret = p;
   993				break;
   994			case NVMF_OPT_TLS:
   995	#ifdef CONFIG_NVME_TLS
   996				opts->tls = true;
   997				break;
   998	#else
   999				pr_err("TLS is not supported\n");
  1000				ret = -EINVAL;
  1001				goto out;
  1002	#endif
  1003			default:
  1004				pr_warn("unknown parameter or missing value '%s' in ctrl creation request\n",
  1005					p);
  1006				ret = -EINVAL;
  1007				goto out;
  1008			}
  1009		}
  1010	
  1011		if (opts->discovery_nqn) {
  1012			opts->nr_io_queues = 0;
  1013			opts->nr_write_queues = 0;
  1014			opts->nr_poll_queues = 0;
  1015			opts->duplicate_connect = true;
  1016		} else {
  1017			if (!opts->kato)
  1018				opts->kato = NVME_DEFAULT_KATO;
  1019		}
  1020		if (ctrl_loss_tmo < 0) {
  1021			opts->max_reconnects = -1;
  1022		} else {
  1023			opts->max_reconnects = DIV_ROUND_UP(ctrl_loss_tmo,
  1024							opts->reconnect_delay);
  1025			if (ctrl_loss_tmo < opts->fast_io_fail_tmo)
  1026				pr_warn("failfast tmo (%d) larger than controller loss tmo (%d)\n",
  1027					opts->fast_io_fail_tmo, ctrl_loss_tmo);
  1028		}
  1029	
  1030		if (!opts->host) {
  1031			kref_get(&nvmf_default_host->ref);
  1032			opts->host = nvmf_default_host;
  1033		}
  1034	
  1035		uuid_copy(&opts->host->id, &hostid);
  1036	
  1037	out:
  1038		kfree(options);
  1039		return ret;
  1040	}
  1041	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
