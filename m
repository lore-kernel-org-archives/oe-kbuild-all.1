Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A511C774
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683802129; x=1715338129;
  h=date:from:cc:subject:message-id:mime-version;
  bh=iNFFmceCH+KPodAEJAcVMQOSrkRbfBGJ7xz5XOS7ZwU=;
  b=fcj88tFTx5Xh+sGWlIZPrd2VUiwgSUOdMLFICRLagkp91oT3nhoHMarA
   Trzmg+r3kD4UehPKAG41BkYE/cgJ6GLZ7P9QYUtFrUabk5PtrOshm2RMZ
   eKyw2H4BAxYRRJXjXJYw1BGqVNfqnuQIV8wLfb5rH0Xf3wXPNBeSN0wQa
   SVMfsSirpERDNibv5AKRLoQOgsTFQLvCZFxfc/laoLbPzzcAym70sD1LC
   LxNoDppcrTx46V7BiSWNC65p9k/3HgnkLUl6CwjpHB5c+MI6Li68y76p2
   CBhiQVE+Anofe3ujv4yTAaUoD8Zce4T5n2BEbwGt2RD5Vxaa6lUKyL92a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353557835"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="353557835"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 03:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="693749431"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="693749431"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2023 03:48:02 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px3q6-0003xr-0K;
	Thu, 11 May 2023 10:48:02 +0000
Date: Thu, 11 May 2023 18:47:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 4265/30000]
 security/integrity/ima/ima_policy.c:332:57: warning: passing argument 1 of
 'security_filter_rule_match' makes integer from pointer without a cast
Message-ID: <202305111857.KQ9TbLK2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Casey,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a849597f74a39781c6e75671b5a91bb4e0043a43
commit: eed83a72594ddc4b511764ff1255ae244f8a0bc9 [4265/30000] LSM: Use multiple secids in LSM interfaces
config: nds32-buildonly-randconfig-r004-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111857.KQ9TbLK2-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/eed83a72594ddc4b511764ff1255ae244f8a0bc9
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_s
        git checkout eed83a72594ddc4b511764ff1255ae244f8a0bc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash M=security/integrity/ima

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111857.KQ9TbLK2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/integrity/ima/ima_policy.c: In function 'ima_lsm_update_rules':
   security/integrity/ima/ima_policy.c:253:13: warning: variable 'result' set but not used [-Wunused-but-set-variable]
     253 |         int result;
         |             ^~~~~~
   security/integrity/ima/ima_policy.c: In function 'ima_match_rules':
>> security/integrity/ima/ima_policy.c:332:57: warning: passing argument 1 of 'security_filter_rule_match' makes integer from pointer without a cast [-Wint-conversion]
     332 |                         rc = security_filter_rule_match(&osid,
         |                                                         ^~~~~
         |                                                         |
         |                                                         struct secids *
   In file included from security/integrity/ima/ima_policy.c:24:
   security/integrity/ima/ima.h:311:50: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct secids *'
     311 | static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
         |                                              ~~~~^~~~~
   security/integrity/ima/ima_policy.c:341:57: warning: passing argument 1 of 'security_filter_rule_match' makes integer from pointer without a cast [-Wint-conversion]
     341 |                         rc = security_filter_rule_match(secid,
         |                                                         ^~~~~
         |                                                         |
         |                                                         struct secids *
   security/integrity/ima/ima.h:311:50: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct secids *'
     311 | static inline int security_filter_rule_match(u32 secid, u32 field, u32 op,
         |                                              ~~~~^~~~~
   security/integrity/ima/ima_policy.c: In function 'ima_init_policy':
   security/integrity/ima/ima_policy.c:526:23: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     526 |         for (i = 0; i < ARRAY_SIZE(build_appraise_rules); i++) {
         |                       ^
   security/integrity/ima/ima_policy.c: In function 'ima_parse_rule':
   security/integrity/ima/ima_policy.c:856:39: warning: this statement may fall through [-Wimplicit-fallthrough=]
     856 |                         entry->uid_op = &uid_gt;
         |                         ~~~~~~~~~~~~~~^~~~~~~~~
   security/integrity/ima/ima_policy.c:857:17: note: here
     857 |                 case Opt_uid_lt:
         |                 ^~~~
   security/integrity/ima/ima_policy.c:859:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
     859 |                         if ((token == Opt_uid_lt) || (token == Opt_euid_lt))
         |                            ^
   security/integrity/ima/ima_policy.c:861:17: note: here
     861 |                 case Opt_uid_eq:
         |                 ^~~~
   security/integrity/ima/ima_policy.c:888:42: warning: this statement may fall through [-Wimplicit-fallthrough=]
     888 |                         entry->fowner_op = &uid_gt;
         |                         ~~~~~~~~~~~~~~~~~^~~~~~~~~
   security/integrity/ima/ima_policy.c:889:17: note: here
     889 |                 case Opt_fowner_lt:
         |                 ^~~~
   security/integrity/ima/ima_policy.c:890:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
     890 |                         if (token == Opt_fowner_lt)
         |                            ^
   security/integrity/ima/ima_policy.c:892:17: note: here
     892 |                 case Opt_fowner_eq:
         |                 ^~~~
   security/integrity/ima/ima_policy.c:405: warning: Function parameter or member 'flags' not described in 'ima_match_policy'
   security/integrity/ima/ima_policy.c:999: warning: Function parameter or member 'rule' not described in 'ima_parse_add_rule'


vim +/security_filter_rule_match +332 security/integrity/ima/ima_policy.c

   243	
   244	/*
   245	 * The LSM policy can be reloaded, leaving the IMA LSM based rules referring
   246	 * to the old, stale LSM policy.  Update the IMA LSM based rules to reflect
   247	 * the reloaded LSM policy.  We assume the rules still exist; and BUG_ON() if
   248	 * they don't.
   249	 */
   250	static void ima_lsm_update_rules(void)
   251	{
   252		struct ima_rule_entry *entry;
 > 253		int result;
   254		int i;
   255	
   256		list_for_each_entry(entry, &ima_policy_rules, list) {
   257			for (i = 0; i < MAX_LSM_RULES; i++) {
   258				if (!entry->lsm[i].rule)
   259					continue;
   260				result = security_filter_rule_init(entry->lsm[i].type,
   261								   Audit_equal,
   262								   entry->lsm[i].args_p,
   263								   &entry->lsm[i].rule);
   264				BUG_ON(!entry->lsm[i].rule);
   265			}
   266		}
   267	}
   268	
   269	/**
   270	 * ima_match_rules - determine whether an inode matches the measure rule.
   271	 * @rule: a pointer to a rule
   272	 * @inode: a pointer to an inode
   273	 * @cred: a pointer to a credentials structure for user validation
   274	 * @secid: the secid of the task to be validated
   275	 * @func: LIM hook identifier
   276	 * @mask: requested action (MAY_READ | MAY_WRITE | MAY_APPEND | MAY_EXEC)
   277	 *
   278	 * Returns true on rule match, false on failure.
   279	 */
   280	static bool ima_match_rules(struct ima_rule_entry *rule, struct inode *inode,
   281				    const struct cred *cred, struct secids *secid,
   282				    enum ima_hooks func, int mask)
   283	{
   284		int i;
   285	
   286		if ((rule->flags & IMA_FUNC) &&
   287		    (rule->func != func && func != POST_SETATTR))
   288			return false;
   289		if ((rule->flags & IMA_MASK) &&
   290		    (rule->mask != mask && func != POST_SETATTR))
   291			return false;
   292		if ((rule->flags & IMA_INMASK) &&
   293		    (!(rule->mask & mask) && func != POST_SETATTR))
   294			return false;
   295		if ((rule->flags & IMA_FSMAGIC)
   296		    && rule->fsmagic != inode->i_sb->s_magic)
   297			return false;
   298		if ((rule->flags & IMA_FSNAME)
   299		    && strcmp(rule->fsname, inode->i_sb->s_type->name))
   300			return false;
   301		if ((rule->flags & IMA_FSUUID) &&
   302		    !uuid_equal(&rule->fsuuid, &inode->i_sb->s_uuid))
   303			return false;
   304		if ((rule->flags & IMA_UID) && !rule->uid_op(cred->uid, rule->uid))
   305			return false;
   306		if (rule->flags & IMA_EUID) {
   307			if (has_capability_noaudit(current, CAP_SETUID)) {
   308				if (!rule->uid_op(cred->euid, rule->uid)
   309				    && !rule->uid_op(cred->suid, rule->uid)
   310				    && !rule->uid_op(cred->uid, rule->uid))
   311					return false;
   312			} else if (!rule->uid_op(cred->euid, rule->uid))
   313				return false;
   314		}
   315	
   316		if ((rule->flags & IMA_FOWNER) &&
   317		    !rule->fowner_op(inode->i_uid, rule->fowner))
   318			return false;
   319		for (i = 0; i < MAX_LSM_RULES; i++) {
   320			int rc = 0;
   321			struct secids osid;
   322			int retried = 0;
   323	
   324			if (!rule->lsm[i].rule)
   325				continue;
   326	retry:
   327			switch (i) {
   328			case LSM_OBJ_USER:
   329			case LSM_OBJ_ROLE:
   330			case LSM_OBJ_TYPE:
   331				security_inode_getsecid(inode, &osid);
 > 332				rc = security_filter_rule_match(&osid,
   333								rule->lsm[i].type,
   334								Audit_equal,
   335								rule->lsm[i].rule,
   336								NULL);
   337				break;
   338			case LSM_SUBJ_USER:
   339			case LSM_SUBJ_ROLE:
   340			case LSM_SUBJ_TYPE:
   341				rc = security_filter_rule_match(secid,
   342								rule->lsm[i].type,
   343								Audit_equal,
   344								rule->lsm[i].rule,
   345								NULL);
   346			default:
   347				break;
   348			}
   349			if ((rc < 0) && (!retried)) {
   350				retried = 1;
   351				ima_lsm_update_rules();
   352				goto retry;
   353			}
   354			if (!rc)
   355				return false;
   356		}
   357		return true;
   358	}
   359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
