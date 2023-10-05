Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C6182A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5+aQqJZ"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696511000; x=1728047000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W/PCtOS5b09MjjyCwfmvfVjXeeygi3zQCqKrkimgz0Y=;
  b=g5+aQqJZQRdBHtXlUEvs4pmrHYt/v/phgcG77Ss1BJCxJCrsRtNzzp+I
   phHRr9OehRdb8xatPv5uqRcMfUOZCd0ZyI0HEwq609kZPJLl+uycVBWM+
   F0+wv8SQCxdeJSIC2pJHV6sksVrpUwu5lrIawTLHUu0o+WhnxTL/XxR8Y
   T2UI0MWdHdKz/4d3YEcbmST4bbvClnvJXYGpcvNh0lH6RcvEEE6SB9dJQ
   gPu1dfbksQNiGJSvwpX2fHry9cH6iToopXVEYH3ZySzTpv81fHmBWL8h6
   dIXZGpIKoqadqTf1pLv60OSUhbu5A2cYx72+wgeBzQyOE2erzgLygjxTQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387359391"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="387359391"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875552523"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="875552523"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Oct 2023 06:01:52 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoNzC-000LOy-0C;
	Thu, 05 Oct 2023 13:01:50 +0000
Date: Thu, 5 Oct 2023 21:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v11 08/19] uapi|audit|ipe: add ipe auditing support
Message-ID: <202310052054.nkVLpCCa-lkp@intel.com>
References: <1696457386-3010-9-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1696457386-3010-9-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next lwn/docs-next linus/master v6.6-rc4 next-20231005]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20231005-061243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/1696457386-3010-9-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v11 08/19] uapi|audit|ipe: add ipe auditing support
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20231005/202310052054.nkVLpCCa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310052054.nkVLpCCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310052054.nkVLpCCa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/ipe/audit.c:76: warning: Excess function parameter 'enforce' description in 'ipe_audit_match'
>> security/ipe/audit.c:118: warning: Function parameter or member 'audit_format' not described in 'audit_policy'
>> security/ipe/audit.c:158: warning: Function parameter or member 'op' not described in 'ipe_audit_policy_activation'
>> security/ipe/audit.c:158: warning: Function parameter or member 'np' not described in 'ipe_audit_policy_activation'
>> security/ipe/audit.c:158: warning: Excess function parameter 'p' description in 'ipe_audit_policy_activation'


vim +76 security/ipe/audit.c

    61	
    62	/**
    63	 * ipe_audit_match - audit a match for IPE policy.
    64	 * @ctx: Supplies a pointer to the evaluation context that was used in the
    65	 *	 evaluation.
    66	 * @match_type: Supplies the scope of the match: rule, operation default,
    67	 *		global default.
    68	 * @act: Supplies the IPE's evaluation decision, deny or allow.
    69	 * @r: Supplies a pointer to the rule that was matched, if possible.
    70	 * @enforce: Supplies the enforcement/permissive state at the point
    71	 *	     the enforcement decision was made.
    72	 */
    73	void ipe_audit_match(const struct ipe_eval_ctx *const ctx,
    74			     enum ipe_match match_type,
    75			     enum ipe_action_type act, const struct ipe_rule *const r)
  > 76	{
    77		struct inode *inode;
    78		struct audit_buffer *ab;
    79		const char *op = audit_op_names[ctx->op];
    80	
    81		if (act != IPE_ACTION_DENY && !READ_ONCE(success_audit))
    82			return;
    83	
    84		ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_IPE_ACCESS);
    85		if (!ab)
    86			return;
    87	
    88		if (ctx->file) {
    89			audit_log_d_path(ab, "path=", &ctx->file->f_path);
    90			inode = file_inode(ctx->file);
    91			if (inode) {
    92				audit_log_format(ab, " dev=");
    93				audit_log_untrustedstring(ab, inode->i_sb->s_id);
    94				audit_log_format(ab, " ino=%lu ", inode->i_ino);
    95			}
    96		}
    97	
    98		if (match_type == IPE_MATCH_RULE)
    99			audit_rule(ab, r);
   100		else if (match_type == IPE_MATCH_TABLE)
   101			audit_log_format(ab, "rule=\"DEFAULT op=%s action=%s\"", op,
   102					 ACTSTR(act));
   103		else
   104			audit_log_format(ab, "rule=\"DEFAULT action=%s\"",
   105					 ACTSTR(act));
   106	
   107		audit_log_end(ab);
   108	}
   109	
   110	/**
   111	 * audit_policy - Audit a policy's name, version and thumbprint to @ab.
   112	 * @ab: Supplies a pointer to the audit buffer to append to.
   113	 * @p: Supplies a pointer to the policy to audit.
   114	 */
   115	static void audit_policy(struct audit_buffer *ab,
   116				 const char *audit_format,
   117				 const struct ipe_policy *const p)
 > 118	{
   119		u8 *digest = NULL;
   120		struct crypto_shash *tfm;
   121		SHASH_DESC_ON_STACK(desc, tfm);
   122	
   123		tfm = crypto_alloc_shash(IPE_AUDIT_HASH_ALG, 0, 0);
   124		if (IS_ERR(tfm))
   125			return;
   126	
   127		desc->tfm = tfm;
   128	
   129		digest = kzalloc(crypto_shash_digestsize(tfm), GFP_KERNEL);
   130		if (!digest)
   131			goto out;
   132	
   133		if (crypto_shash_init(desc))
   134			goto out;
   135	
   136		if (crypto_shash_update(desc, p->pkcs7, p->pkcs7len))
   137			goto out;
   138	
   139		if (crypto_shash_final(desc, digest))
   140			goto out;
   141	
   142		audit_log_format(ab, audit_format, p->parsed->name,
   143				 p->parsed->version.major, p->parsed->version.minor,
   144				 p->parsed->version.rev);
   145		audit_log_n_hex(ab, digest, crypto_shash_digestsize(tfm));
   146	
   147	out:
   148		kfree(digest);
   149		crypto_free_shash(tfm);
   150	}
   151	
   152	/**
   153	 * ipe_audit_policy_activation - Audit a policy being made the active policy.
   154	 * @p: Supplies a pointer to the policy to audit.
   155	 */
   156	void ipe_audit_policy_activation(const struct ipe_policy *const op,
   157					 const struct ipe_policy *const np)
 > 158	{
   159		struct audit_buffer *ab;
   160	
   161		ab = audit_log_start(audit_context(), GFP_KERNEL,
   162				     AUDIT_IPE_CONFIG_CHANGE);
   163		if (!ab)
   164			return;
   165	
   166		audit_policy(ab, AUDIT_OLD_ACTIVE_POLICY_FMT, op);
   167		audit_log_format(ab, " ");
   168		audit_policy(ab, AUDIT_NEW_ACTIVE_POLICY_FMT, np);
   169		audit_log_format(ab, " auid=%u ses=%u lsm=ipe res=1",
   170				 from_kuid(&init_user_ns, audit_get_loginuid(current)),
   171				 audit_get_sessionid(current));
   172	
   173		audit_log_end(ab);
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
