Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EB2E65C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695895095; x=1727431095;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2axlllHA8cJQlOeqyeA43dFwziBKSLEd4SYQWO75fqA=;
  b=EYrWtbXrb2cTRpjEOogTWgHKEZT0UvfRIYeRbRtfvC5ccdDYdGVD52Fi
   gnMHNgkCZQoPP9X8VVLQJeOeN2n9+N9pLigXmM3Vn5McqqNveWlCLVWME
   7FOKNKHklJk3L3xEEng/WM07HgfXVrHDPYsFllryO4ad2jd9eFu9xlXnw
   M4FG7zifsvqM6eJTT0LhXLK+HslN9EcOKpxu3P3+McM6/9e5C0G87BW6V
   cQbXQI1EhCnSS1Z4Ptf9v+TJLi27JN3Iw+S86FJiCBoapDT1eDNgdllaG
   J02V4Vrg/giRA21lvJExdQ04wZd5YSy2lygKASQkgGHl46WOA1HBVqB9A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468309482"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="468309482"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 02:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778849230"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="778849230"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 02:58:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlnmD-0001Kv-1O;
	Thu, 28 Sep 2023 09:58:03 +0000
Date: Thu, 28 Sep 2023 17:57:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 3171/30000]
 security/integrity/ima/ima_policy.c:332:57: warning: passing argument 1 of
 'security_filter_rule_match' makes integer from pointer without a cast
Message-ID: <202309281700.IpTmxJQl-lkp@intel.com>
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
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: eed83a72594ddc4b511764ff1255ae244f8a0bc9 [3171/30000] LSM: Use multiple secids in LSM interfaces
config: arc-randconfig-r032-20230906 (https://download.01.org/0day-ci/archive/20230928/202309281700.IpTmxJQl-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281700.IpTmxJQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281700.IpTmxJQl-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
