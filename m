Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94611CA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 23:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735946852; cv=none; b=bVKgjazsKjlwNcHbf4/KNQeQshxaW9AKz4Z3Sz0nzbBI92qmYX55RUL1WrDDCvuplxtjFmWU0PjWBs/d4FBVRymfowU6BetX9JAdhRplLb2yyvLvvBCRxHYhpBTCPV4fRtyfd4TYKXqHphVwqrv46wJfvKvgl0J0R0dgL1UgEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735946852; c=relaxed/simple;
	bh=9bUr8wtFaKEXrBjUxKwuxsbyZeRLGOERI41FpKoPyL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VbM/iPNR6DojDkO6RAWhOMrLHF92GQxxhYDOeSs0QDkoIQ8/8PWK7Yw3N3rw6aznjWN0dvo6l0hmU0kwiCsqxbsMwNnIycOxv0oliVd65jSMG59sWyDdmV1W6IXw+NSV6wah//yFSf0mQLDkuzFe536C+olaORkfcgHptm3RspQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MG++6dDY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MG++6dDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735946851; x=1767482851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9bUr8wtFaKEXrBjUxKwuxsbyZeRLGOERI41FpKoPyL8=;
  b=MG++6dDYHIfeyIOxnmo2ar8+wOS4ilMdxzfSixHd0A1LcWbtUptWQJMu
   gUimiC/pvBA18jNxRSMygw2x72ozyW4mglSx14WBZMhunTt/46XAVOjRw
   2elAX9bcmHA4uxUe1BwzHi/9WQUydfekSMo+g3UkaJxRrXD5YNjYAYXYW
   N7yw4Hi2hg050X6lwYnJYTd7gPChhXyAOiayeJunWWeMGbN61i0QK2rgb
   XjHX6NI/JpqGQyBY709AfAIJWYzXXXL0Ou4I5rbKfTPug1v3uECEObuj+
   yT9Cdi9I/9PuiAcpSSMfXq0yjjimDWVPpKgCPAGq3ux6rRVZCqv6xvUSR
   Q==;
X-CSE-ConnectionGUID: mnPJFXgfRJCesbZVGymPJA==
X-CSE-MsgGUID: r70iVS8ASt6+XBDzK07Emw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36344611"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="36344611"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 15:27:30 -0800
X-CSE-ConnectionGUID: 9qmMBRMdR7SjSckn3mESnQ==
X-CSE-MsgGUID: a3BmoTz/TjeYRPU3Vncttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132823440"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2025 15:27:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTr4g-000ART-1d;
	Fri, 03 Jan 2025 23:27:26 +0000
Date: Sat, 4 Jan 2025 07:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	James Morris <jamorris@linux.microsoft.com>,
	Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>
Subject: security/landlock/ruleset.c:96:9: warning: 'memcpy' accessing
 4294967295 bytes at offsets 20 and 0 overlaps 6442450943 bytes at offset
 -2147483648
Message-ID: <202501040747.S3LYfvYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: ae271c1b14de343b888e77f74f640e3dcbdeb4c9 landlock: Add ruleset and domain management
date:   3 years, 8 months ago
config: csky-randconfig-r026-20230729 (https://download.01.org/0day-ci/archive/20250104/202501040747.S3LYfvYq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501040747.S3LYfvYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040747.S3LYfvYq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/landlock/ruleset.c: In function 'create_rule':
>> security/landlock/ruleset.c:96:9: warning: 'memcpy' accessing 4294967295 bytes at offsets 20 and 0 overlaps 6442450943 bytes at offset -2147483648 [-Wrestrict]
      96 |         memcpy(new_rule->layers, layers,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                         flex_array_size(new_rule, layers, num_layers));
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1532, <IN_FILE> line 146.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 146.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1484, <IN_FILE> line 146.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1588, <IN_FILE> line 146.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1616, <IN_FILE> line 146.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1626, <IN_FILE> line 146.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1626, <IN_FILE> line 146.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1627, <IN_FILE> line 146.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1629, <IN_FILE> line 146.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1630, <IN_FILE> line 146.
>> security/landlock/ruleset.c:146: warning: Function parameter or struct member '' not described in 'insert_rule'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1645, <IN_FILE> line 146.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1806, <IN_FILE> line 146.
>> security/landlock/ruleset.c:146: warning: Excess function parameter 'layers' description in 'insert_rule'


vim +/memcpy +96 security/landlock/ruleset.c

    68	
    69	static struct landlock_rule *create_rule(
    70			struct landlock_object *const object,
    71			const struct landlock_layer (*const layers)[],
    72			const u32 num_layers,
    73			const struct landlock_layer *const new_layer)
    74	{
    75		struct landlock_rule *new_rule;
    76		u32 new_num_layers;
    77	
    78		build_check_rule();
    79		if (new_layer) {
    80			/* Should already be checked by landlock_merge_ruleset(). */
    81			if (WARN_ON_ONCE(num_layers >= LANDLOCK_MAX_NUM_LAYERS))
    82				return ERR_PTR(-E2BIG);
    83			new_num_layers = num_layers + 1;
    84		} else {
    85			new_num_layers = num_layers;
    86		}
    87		new_rule = kzalloc(struct_size(new_rule, layers, new_num_layers),
    88				GFP_KERNEL_ACCOUNT);
    89		if (!new_rule)
    90			return ERR_PTR(-ENOMEM);
    91		RB_CLEAR_NODE(&new_rule->node);
    92		landlock_get_object(object);
    93		new_rule->object = object;
    94		new_rule->num_layers = new_num_layers;
    95		/* Copies the original layer stack. */
  > 96		memcpy(new_rule->layers, layers,
    97				flex_array_size(new_rule, layers, num_layers));
    98		if (new_layer)
    99			/* Adds a copy of @new_layer on the layer stack. */
   100			new_rule->layers[new_rule->num_layers - 1] = *new_layer;
   101		return new_rule;
   102	}
   103	
   104	static void free_rule(struct landlock_rule *const rule)
   105	{
   106		might_sleep();
   107		if (!rule)
   108			return;
   109		landlock_put_object(rule->object);
   110		kfree(rule);
   111	}
   112	
   113	static void build_check_ruleset(void)
   114	{
   115		const struct landlock_ruleset ruleset = {
   116			.num_rules = ~0,
   117			.num_layers = ~0,
   118		};
   119	
   120		BUILD_BUG_ON(ruleset.num_rules < LANDLOCK_MAX_NUM_RULES);
   121		BUILD_BUG_ON(ruleset.num_layers < LANDLOCK_MAX_NUM_LAYERS);
   122	}
   123	
   124	/**
   125	 * insert_rule - Create and insert a rule in a ruleset
   126	 *
   127	 * @ruleset: The ruleset to be updated.
   128	 * @object: The object to build the new rule with.  The underlying kernel
   129	 *          object must be held by the caller.
   130	 * @layers: One or multiple layers to be copied into the new rule.
   131	 * @num_layers: The number of @layers entries.
   132	 *
   133	 * When user space requests to add a new rule to a ruleset, @layers only
   134	 * contains one entry and this entry is not assigned to any level.  In this
   135	 * case, the new rule will extend @ruleset, similarly to a boolean OR between
   136	 * access rights.
   137	 *
   138	 * When merging a ruleset in a domain, or copying a domain, @layers will be
   139	 * added to @ruleset as new constraints, similarly to a boolean AND between
   140	 * access rights.
   141	 */
   142	static int insert_rule(struct landlock_ruleset *const ruleset,
   143			struct landlock_object *const object,
   144			const struct landlock_layer (*const layers)[],
   145			size_t num_layers)
 > 146	{
   147		struct rb_node **walker_node;
   148		struct rb_node *parent_node = NULL;
   149		struct landlock_rule *new_rule;
   150	
   151		might_sleep();
   152		lockdep_assert_held(&ruleset->lock);
   153		if (WARN_ON_ONCE(!object || !layers))
   154			return -ENOENT;
   155		walker_node = &(ruleset->root.rb_node);
   156		while (*walker_node) {
   157			struct landlock_rule *const this = rb_entry(*walker_node,
   158					struct landlock_rule, node);
   159	
   160			if (this->object != object) {
   161				parent_node = *walker_node;
   162				if (this->object < object)
   163					walker_node = &((*walker_node)->rb_right);
   164				else
   165					walker_node = &((*walker_node)->rb_left);
   166				continue;
   167			}
   168	
   169			/* Only a single-level layer should match an existing rule. */
   170			if (WARN_ON_ONCE(num_layers != 1))
   171				return -EINVAL;
   172	
   173			/* If there is a matching rule, updates it. */
   174			if ((*layers)[0].level == 0) {
   175				/*
   176				 * Extends access rights when the request comes from
   177				 * landlock_add_rule(2), i.e. @ruleset is not a domain.
   178				 */
   179				if (WARN_ON_ONCE(this->num_layers != 1))
   180					return -EINVAL;
   181				if (WARN_ON_ONCE(this->layers[0].level != 0))
   182					return -EINVAL;
   183				this->layers[0].access |= (*layers)[0].access;
   184				return 0;
   185			}
   186	
   187			if (WARN_ON_ONCE(this->layers[0].level == 0))
   188				return -EINVAL;
   189	
   190			/*
   191			 * Intersects access rights when it is a merge between a
   192			 * ruleset and a domain.
   193			 */
   194			new_rule = create_rule(object, &this->layers, this->num_layers,
   195					&(*layers)[0]);
   196			if (IS_ERR(new_rule))
   197				return PTR_ERR(new_rule);
   198			rb_replace_node(&this->node, &new_rule->node, &ruleset->root);
   199			free_rule(this);
   200			return 0;
   201		}
   202	
   203		/* There is no match for @object. */
   204		build_check_ruleset();
   205		if (ruleset->num_rules >= LANDLOCK_MAX_NUM_RULES)
   206			return -E2BIG;
   207		new_rule = create_rule(object, layers, num_layers, NULL);
   208		if (IS_ERR(new_rule))
   209			return PTR_ERR(new_rule);
   210		rb_link_node(&new_rule->node, parent_node, walker_node);
   211		rb_insert_color(&new_rule->node, &ruleset->root);
   212		ruleset->num_rules++;
   213		return 0;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
