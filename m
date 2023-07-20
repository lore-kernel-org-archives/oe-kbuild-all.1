Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFAF17723
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 14:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689863919; x=1721399919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lgQXhZJEPJe56VQB2gV2H3KOeA7V4JX7thMnYcmwZOA=;
  b=kjgHb5opaMvpZualsdmb2iQrvB2QpS1EUY720G3UqeGKOKmJ8MzL/zvm
   GQmgNT0Rw9ifly49os1V8KW+mXce6qFdUR6lwyBL4ujs/8Ia5eu6nIfFP
   jEhyPRojfsDHux4xEyENMQ5ITLtJFCvaQrS3aRmaRyo3W3Bv88wqZoNtW
   t2yqR0KG8fyuxH/OmNBkP3gUzkOb+Y0qByP9tS6ubmtJT/7iB19gbTYjf
   PDKy0OzXx98RHTxSxZ8NZxRi/mdTVZu4O6dGcDXCkveklFx2YJVJ2X/dZ
   nKU9CwFaQKYLnNmJjHgIvfeGUdUI3To6VveeJFjwO3koqAu3KuFNMP0D2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430544121"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="430544121"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 07:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838144924"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="838144924"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jul 2023 07:38:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMUnI-0006A1-2b;
	Thu, 20 Jul 2023 14:38:16 +0000
Date: Thu, 20 Jul 2023 22:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Emma Anholt <emma@anholt.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 05/11] drm/tests: helpers: Create a helper to allocate
 a locking ctx
Message-ID: <202307202244.26VyeZKj-lkp@intel.com>
References: <20230720-kms-kunit-actions-rework-v2-5-175017bd56ab@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720-kms-kunit-actions-rework-v2-5-175017bd56ab@kernel.org>

Hi Maxime,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c58c49dd89324b18a812762a2bfa5a0458e4f252]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-tests-helpers-Switch-to-kunit-actions/20230720-191901
base:   c58c49dd89324b18a812762a2bfa5a0458e4f252
patch link:    https://lore.kernel.org/r/20230720-kms-kunit-actions-rework-v2-5-175017bd56ab%40kernel.org
patch subject: [PATCH v2 05/11] drm/tests: helpers: Create a helper to allocate a locking ctx
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307202244.26VyeZKj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202244.26VyeZKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202244.26VyeZKj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:145: warning: expecting prototype for drm_kunit_helper_context_alloc(). Prototype was for drm_kunit_helper_acquire_ctx_alloc() instead


vim +145 drivers/gpu/drm/tests/drm_kunit_helpers.c

   130	
   131	/**
   132	 * drm_kunit_helper_context_alloc - Allocates an acquire context
   133	 * @test: The test context object
   134	 *
   135	 * Allocates and initializes a modeset acquire context.
   136	 *
   137	 * The context is tied to the kunit test context, so we must not call
   138	 * drm_modeset_acquire_fini() on it, it will be done so automatically.
   139	 *
   140	 * Returns:
   141	 * An ERR_PTR on error, a pointer to the newly allocated context otherwise
   142	 */
   143	struct drm_modeset_acquire_ctx *
   144	drm_kunit_helper_acquire_ctx_alloc(struct kunit *test)
 > 145	{
   146		struct drm_modeset_acquire_ctx *ctx;
   147		int ret;
   148	
   149		ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
   150		KUNIT_ASSERT_NOT_NULL(test, ctx);
   151	
   152		drm_modeset_acquire_init(ctx, 0);
   153	
   154		ret = kunit_add_action_or_reset(test,
   155						action_drm_release_context,
   156						ctx);
   157		if (ret)
   158			return ERR_PTR(ret);
   159	
   160		return ctx;
   161	}
   162	EXPORT_SYMBOL_GPL(drm_kunit_helper_acquire_ctx_alloc);
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
