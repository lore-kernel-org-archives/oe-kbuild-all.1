Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF93CD8B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727053; cv=none; b=Mn5y0Ca0sBRQSwphSUKZHw+1IlUeEJ6WHls0R6ihWMA0y37GgqqgtXKTqEKoF7DSDykKgTWKARZ9Pbbk5RBPPM6FKbk6LWlns38dxStEKWE0dbw9SmNkoCJaQXUd3RJRnMsqaUI8lzsPF6W2BMj+UJ4q+og34h2OKocALXmj8Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727053; c=relaxed/simple;
	bh=Elj6iN1s4cGMcc7cx0sovtKPXv0zAOJaEwdcZvob0GI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CknZ76x+ejjToQIuRTYyrUeicd5+fY0G8WbrVjS+4ng5GcyVrQHdZ5JIAEFgQjgDiI6LmQH4syE8tlqDOoVbBf8aa9W3X9NskIUpm4rXlcM3SYVyvtlLiNFWS/vPjLtHXQfEUxRYYuDz7XRAl7Zc6tK1bJc/0RNZX8q/ieKT5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtvA5hPI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtvA5hPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772727047; x=1804263047;
  h=date:from:to:cc:subject:message-id;
  bh=Elj6iN1s4cGMcc7cx0sovtKPXv0zAOJaEwdcZvob0GI=;
  b=gtvA5hPIu388zedG1ff+Xd8kcqhD0Owv17hcVYfXT1D3yB3PHLqBipbs
   TBMupXVs44rESQsIc3xhc38WWJWN3wc2pMrEes5Tn0/lD950fJ0vl9rAq
   Y2x3gIxljuSKFIvVFQimGcFnbzCRlfEkoHZ2kSrVRoGoCd5os5UKdBGnf
   q4nup+rJ6rgzAR4iGcvD6J//MuhXMYUE70IVtRkBVZgT9jA0Em0hPWLXL
   xr7HHIi3nK3KPQi/zp84abpjU468kkde68wyGqD7VKnLw+HQpBCpgOZ51
   W8Dqi/yoo/+lvAWPXdbBkoXciWUVNOXiEDda13TybMpjPgGylNG22uUtn
   w==;
X-CSE-ConnectionGUID: h3G3VZS4S9GrOh7zdQbsFw==
X-CSE-MsgGUID: 2OPVTndLS/mPJ7m7CXsJ5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84903336"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="84903336"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:10:46 -0800
X-CSE-ConnectionGUID: jH/mbRVXSZ2EN9mtfBip4A==
X-CSE-MsgGUID: AnS47jbRSKW9ZNVjrabsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216998070"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 08:10:45 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyBHf-0000000021v-0sWA;
	Thu, 05 Mar 2026 16:10:43 +0000
Date: Thu, 05 Mar 2026 17:10:36 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-05-5 87/88]
 sound/soc/codecs/cs35l56-test.c:87:27: error: invalid use of undefined type
 'struct snd_soc_component'
Message-ID: <202603051746.kyjjVBUe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-05-5
head:   bfb54f3735c9a8e0faed8d460d5051dd1a1eda2d
commit: 4245653edad7843d44522649c3af92184db6d306 [87/88] move component
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260305/202603051746.kyjjVBUe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051746.kyjjVBUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051746.kyjjVBUe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-topology-test.c:48:34: error: field 'comp' has incomplete type
      48 |         struct snd_soc_component comp;
         |                                  ^~~~
   In file included from include/linux/bits.h:30,
                    from include/linux/gfp_types.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/firmware.h:8,
                    from sound/soc/soc-topology-test.c:8:
   sound/soc/soc-topology-test.c: In function 'd_probe':
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   sound/soc/soc-topology-test.c:56:25: note: in expansion of macro 'container_of'
      56 |                         container_of(component, struct kunit_soc_component, comp);
         |                         ^~~~~~~~~~~~
   sound/soc/soc-topology-test.c: In function 'd_remove':
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   sound/soc/soc-topology-test.c:69:25: note: in expansion of macro 'container_of'
      69 |                         container_of(component, struct kunit_soc_component, comp);
         |                         ^~~~~~~~~~~~
   sound/soc/soc-topology-test.c: In function 'd_probe_null_comp':
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   sound/soc/soc-topology-test.c:218:25: note: in expansion of macro 'container_of'
     218 |                         container_of(component, struct kunit_soc_component, comp);
         |                         ^~~~~~~~~~~~
   sound/soc/soc-topology-test.c: In function 'd_probe_null_fw':
   include/linux/compiler_types.h:617:27: error: expression in static assertion is not an integer
     617 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   sound/soc/soc-topology-test.c:322:25: note: in expansion of macro 'container_of'
     322 |                         container_of(component, struct kunit_soc_component, comp);
         |                         ^~~~~~~~~~~~
--
>> sound/soc/soc-ops-test.c:70:34: error: field 'component' has incomplete type
      70 |         struct snd_soc_component component;
         |                                  ^~~~~~~~~
--
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_l56_b0_suffix_sdw':
>> sound/soc/codecs/cs35l56-test.c:87:27: error: invalid use of undefined type 'struct snd_soc_component'
      87 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_suffix_sdw':
   sound/soc/codecs/cs35l56-test.c:112:27: error: invalid use of undefined type 'struct snd_soc_component'
     112 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_suffix_i2cspi':
   sound/soc/codecs/cs35l56-test.c:135:27: error: invalid use of undefined type 'struct snd_soc_component'
     135 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_ssidexv2_suffix_sdw':
   sound/soc/codecs/cs35l56-test.c:178:27: error: invalid use of undefined type 'struct snd_soc_component'
     178 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   sound/soc/codecs/cs35l56-test.c:185:53: error: invalid use of undefined type 'struct snd_soc_component'
     185 |         snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
         |                                                     ^~
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_ssidexv2_suffix_i2cspi':
   sound/soc/codecs/cs35l56-test.c:208:27: error: invalid use of undefined type 'struct snd_soc_component'
     208 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   sound/soc/codecs/cs35l56-test.c:211:53: error: invalid use of undefined type 'struct snd_soc_component'
     211 |         snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
         |                                                     ^~
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw':
   sound/soc/codecs/cs35l56-test.c:243:27: error: invalid use of undefined type 'struct snd_soc_component'
     243 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   sound/soc/codecs/cs35l56-test.c:250:53: error: invalid use of undefined type 'struct snd_soc_component'
     250 |         snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
         |                                                     ^~
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_case_init_common':
>> sound/soc/codecs/cs35l56-test.c:479:56: error: invalid application of 'sizeof' to incomplete type 'struct snd_soc_component'
     479 |         cs35l56->component = kunit_kzalloc(test, sizeof(*cs35l56->component), GFP_KERNEL);
         |                                                        ^
   sound/soc/codecs/cs35l56-test.c:481:27: error: invalid use of undefined type 'struct snd_soc_component'
     481 |         cs35l56->component->dev = cs35l56->base.dev;
         |                           ^~
   sound/soc/codecs/cs35l56-test.c:484:27: error: invalid use of undefined type 'struct snd_soc_component'
     484 |         cs35l56->component->card = kunit_kzalloc(test, sizeof(*cs35l56->component->card),
         |                           ^~
   sound/soc/codecs/cs35l56-test.c:484:82: error: invalid use of undefined type 'struct snd_soc_component'
     484 |         cs35l56->component->card = kunit_kzalloc(test, sizeof(*cs35l56->component->card),
         |                                                                                  ^~
   In file included from include/kunit/resource.h:12,
                    from sound/soc/codecs/cs35l56-test.c:8:
   sound/soc/codecs/cs35l56-test.c:486:55: error: invalid use of undefined type 'struct snd_soc_component'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |                                                       ^~
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l56-test.c:486:55: error: invalid use of undefined type 'struct snd_soc_component'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |                                                       ^~
   include/kunit/test.h:839:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12:
   include/kunit/test.h:1697:41: warning: comparison between pointer and integer
    1697 |                                    ptr, !=, NULL,                              \
         |                                         ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:884:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     884 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> include/kunit/test.h:856:55: error: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     856 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:734:49: note: in definition of macro '_KUNIT_FAILED'
     734 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:855:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     855 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     884 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:856:55: note: (near initialization for '__assertion.left_value')
     856 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:734:49: note: in definition of macro '_KUNIT_FAILED'
     734 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:855:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     855 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     884 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
--
   codecs/cs35l56-test.c: In function 'cs35l56_test_l56_b0_suffix_sdw':
   codecs/cs35l56-test.c:87:27: error: invalid use of undefined type 'struct snd_soc_component'
      87 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   codecs/cs35l56-test.c: In function 'cs35l56_test_suffix_sdw':
   codecs/cs35l56-test.c:112:27: error: invalid use of undefined type 'struct snd_soc_component'
     112 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   codecs/cs35l56-test.c: In function 'cs35l56_test_suffix_i2cspi':
   codecs/cs35l56-test.c:135:27: error: invalid use of undefined type 'struct snd_soc_component'
     135 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   codecs/cs35l56-test.c: In function 'cs35l56_test_ssidexv2_suffix_sdw':
   codecs/cs35l56-test.c:178:27: error: invalid use of undefined type 'struct snd_soc_component'
     178 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   codecs/cs35l56-test.c:185:53: error: invalid use of undefined type 'struct snd_soc_component'
     185 |         snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
         |                                                     ^~
   codecs/cs35l56-test.c: In function 'cs35l56_test_ssidexv2_suffix_i2cspi':
   codecs/cs35l56-test.c:208:27: error: invalid use of undefined type 'struct snd_soc_component'
     208 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   codecs/cs35l56-test.c:211:53: error: invalid use of undefined type 'struct snd_soc_component'
     211 |         snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
         |                                                     ^~
   codecs/cs35l56-test.c: In function 'cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw':
   codecs/cs35l56-test.c:243:27: error: invalid use of undefined type 'struct snd_soc_component'
     243 |         cs35l56->component->name_prefix = "AMP1";
         |                           ^~
   codecs/cs35l56-test.c:250:53: error: invalid use of undefined type 'struct snd_soc_component'
     250 |         snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
         |                                                     ^~
   codecs/cs35l56-test.c: In function 'cs35l56_test_case_init_common':
   codecs/cs35l56-test.c:479:56: error: invalid application of 'sizeof' to incomplete type 'struct snd_soc_component'
     479 |         cs35l56->component = kunit_kzalloc(test, sizeof(*cs35l56->component), GFP_KERNEL);
         |                                                        ^
   codecs/cs35l56-test.c:481:27: error: invalid use of undefined type 'struct snd_soc_component'
     481 |         cs35l56->component->dev = cs35l56->base.dev;
         |                           ^~
   codecs/cs35l56-test.c:484:27: error: invalid use of undefined type 'struct snd_soc_component'
     484 |         cs35l56->component->card = kunit_kzalloc(test, sizeof(*cs35l56->component->card),
         |                           ^~
   codecs/cs35l56-test.c:484:82: error: invalid use of undefined type 'struct snd_soc_component'
     484 |         cs35l56->component->card = kunit_kzalloc(test, sizeof(*cs35l56->component->card),
         |                                                                                  ^~
   In file included from include/kunit/resource.h:12,
                    from codecs/cs35l56-test.c:8:
   codecs/cs35l56-test.c:486:55: error: invalid use of undefined type 'struct snd_soc_component'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |                                                       ^~
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
   codecs/cs35l56-test.c:486:55: error: invalid use of undefined type 'struct snd_soc_component'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |                                                       ^~
   include/kunit/test.h:839:38: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12:
   include/kunit/test.h:1697:41: warning: comparison between pointer and integer
    1697 |                                    ptr, !=, NULL,                              \
         |                                         ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:884:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     884 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
>> include/kunit/test.h:856:55: error: initialization of 'const void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     856 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:734:49: note: in definition of macro '_KUNIT_FAILED'
     734 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:855:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     855 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     884 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:856:55: note: (near initialization for '__assertion.left_value')
     856 |                                         .left_value = __left,                  \
         |                                                       ^~~~~~
   include/kunit/test.h:734:49: note: in definition of macro '_KUNIT_FAILED'
     734 |         const struct assert_class __assertion = INITIALIZER;                   \
         |                                                 ^~~~~~~~~~~
   include/kunit/test.h:855:23: note: in expansion of macro 'KUNIT_INIT_ASSERT'
     855 |                       KUNIT_INIT_ASSERT(.text = &__text,                       \
         |                       ^~~~~~~~~~~~~~~~~
   include/kunit/test.h:884:9: note: in expansion of macro 'KUNIT_BASE_BINARY_ASSERTION'
     884 |         KUNIT_BASE_BINARY_ASSERTION(test,                                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1695:9: note: in expansion of macro 'KUNIT_BINARY_PTR_ASSERTION'
    1695 |         KUNIT_BINARY_PTR_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1690:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL_MSG'
    1690 |         KUNIT_ASSERT_NOT_NULL_MSG(test,                                        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   codecs/cs35l56-test.c:486:9: note: in expansion of macro 'KUNIT_ASSERT_NOT_NULL'
     486 |         KUNIT_ASSERT_NOT_NULL(test, cs35l56->component->card);
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +87 sound/soc/codecs/cs35l56-test.c

d0ab89951197f0 Richard Fitzgerald 2026-01-21   76  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   77  static void cs35l56_test_l56_b0_suffix_sdw(struct kunit *test)
d0ab89951197f0 Richard Fitzgerald 2026-01-21   78  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21   79  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21   80  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21   81  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   82  	/* Set device type info */
d0ab89951197f0 Richard Fitzgerald 2026-01-21   83  	cs35l56->base.type = 0x56;
d0ab89951197f0 Richard Fitzgerald 2026-01-21   84  	cs35l56->base.rev = 0xb0;
d0ab89951197f0 Richard Fitzgerald 2026-01-21   85  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   86  	/* Set the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  @87  	cs35l56->component->name_prefix = "AMP1";
d0ab89951197f0 Richard Fitzgerald 2026-01-21   88  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   89  	/* Set SoundWire link and UID number */
d0ab89951197f0 Richard Fitzgerald 2026-01-21   90  	cs35l56->sdw_link_num = 1;
d0ab89951197f0 Richard Fitzgerald 2026-01-21   91  	cs35l56->sdw_unique_id = 5;
d0ab89951197f0 Richard Fitzgerald 2026-01-21   92  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   93  	kunit_activate_static_stub(test,
d0ab89951197f0 Richard Fitzgerald 2026-01-21   94  				   cs35l56_test_devm_get_vendor_specific_variant_id_none,
d0ab89951197f0 Richard Fitzgerald 2026-01-21   95  				   cs_amp_devm_get_vendor_specific_variant_id);
d0ab89951197f0 Richard Fitzgerald 2026-01-21   96  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   97  	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
d0ab89951197f0 Richard Fitzgerald 2026-01-21   98  
d0ab89951197f0 Richard Fitzgerald 2026-01-21   99  	/* Priority suffix should be the legacy ALSA prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  100  	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "AMP1");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  101  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  102  	/* Fallback suffix should be the new SoundWire ID */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  103  	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  104  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  105  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  106  static void cs35l56_test_suffix_sdw(struct kunit *test)
d0ab89951197f0 Richard Fitzgerald 2026-01-21  107  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  108  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  109  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  110  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  111  	/* Set the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  112  	cs35l56->component->name_prefix = "AMP1";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  113  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  114  	/* Set SoundWire link and UID number */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  115  	cs35l56->sdw_link_num = 1;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  116  	cs35l56->sdw_unique_id = 5;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  117  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  118  	kunit_activate_static_stub(test,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  119  				   cs35l56_test_devm_get_vendor_specific_variant_id_none,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  120  				   cs_amp_devm_get_vendor_specific_variant_id);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  121  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  122  	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
d0ab89951197f0 Richard Fitzgerald 2026-01-21  123  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  124  	/* Suffix should be the SoundWire ID without a fallback */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  125  	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "l1u5");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  126  	KUNIT_EXPECT_NULL(test, cs35l56->fallback_fw_suffix);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  127  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  128  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  129  static void cs35l56_test_suffix_i2cspi(struct kunit *test)
d0ab89951197f0 Richard Fitzgerald 2026-01-21  130  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  131  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  132  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  133  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  134  	/* Set the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  135  	cs35l56->component->name_prefix = "AMP1";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  136  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  137  	kunit_activate_static_stub(test,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  138  				   cs35l56_test_devm_get_vendor_specific_variant_id_none,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  139  				   cs_amp_devm_get_vendor_specific_variant_id);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  140  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  141  	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
d0ab89951197f0 Richard Fitzgerald 2026-01-21  142  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  143  	/* Suffix strings should not be set: use default wm_adsp suffixing */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  144  	KUNIT_EXPECT_NULL(test, cs35l56->dsp.fwf_suffix);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  145  	KUNIT_EXPECT_NULL(test, cs35l56->fallback_fw_suffix);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  146  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  147  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  148  static efi_status_t cs35l56_test_get_efi_ssidexv2(efi_char16_t *name,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  149  						  efi_guid_t *guid,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  150  						  u32 *returned_attr,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  151  						  unsigned long *size,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  152  						  void *buf)
d0ab89951197f0 Richard Fitzgerald 2026-01-21  153  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  154  	struct kunit *test = kunit_get_current_test();
d0ab89951197f0 Richard Fitzgerald 2026-01-21  155  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  156  	unsigned int len;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  157  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  158  	KUNIT_ASSERT_NOT_NULL(test, priv->ssidexv2);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  159  	len = strlen(priv->ssidexv2);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  160  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  161  	if (*size < len) {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  162  		*size = len;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  163  		return EFI_BUFFER_TOO_SMALL;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  164  	}
d0ab89951197f0 Richard Fitzgerald 2026-01-21  165  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  166  	KUNIT_ASSERT_NOT_NULL(test, buf);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  167  	memcpy(buf, priv->ssidexv2, len);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  168  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  169  	return EFI_SUCCESS;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  170  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  171  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  172  static void cs35l56_test_ssidexv2_suffix_sdw(struct kunit *test)
d0ab89951197f0 Richard Fitzgerald 2026-01-21  173  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  174  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  175  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  176  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  177  	/* Set the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  178  	cs35l56->component->name_prefix = "AMP1";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  179  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  180  	/* Set SoundWire link and UID number */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  181  	cs35l56->sdw_link_num = 1;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  182  	cs35l56->sdw_unique_id = 5;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  183  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  184  	/* Set a SSID to enable lookup of SSIDExV2 */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  185  	snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  186  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  187  	priv->ssidexv2 = "10281234_01_BB_CC";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  188  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  189  	kunit_activate_static_stub(test,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  190  				   cs_amp_test_hooks->get_efi_variable,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  191  				   cs35l56_test_get_efi_ssidexv2);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  192  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  193  	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
d0ab89951197f0 Richard Fitzgerald 2026-01-21  194  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  195  	/* Priority suffix should be the SSIDExV2 string with SoundWire ID */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  196  	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "01-l1u5");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  197  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  198  	/* Fallback suffix should be the SoundWireID */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  199  	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  200  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  201  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  202  static void cs35l56_test_ssidexv2_suffix_i2cspi(struct kunit *test)
d0ab89951197f0 Richard Fitzgerald 2026-01-21  203  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  204  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  205  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  206  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  207  	/* Set the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  208  	cs35l56->component->name_prefix = "AMP1";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  209  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  210  	/* Set a SSID to enable lookup of SSIDExV2 */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  211  	snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  212  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  213  	priv->ssidexv2 = "10281234_01_BB_CC";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  214  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  215  	kunit_activate_static_stub(test,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  216  				   cs_amp_test_hooks->get_efi_variable,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  217  				   cs35l56_test_get_efi_ssidexv2);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  218  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  219  	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
d0ab89951197f0 Richard Fitzgerald 2026-01-21  220  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  221  	/* Priority suffix should be the SSIDExV2 string with ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  222  	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "01-AMP1");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  223  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  224  	/* Fallback suffix should be the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  225  	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "AMP1");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  226  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  227  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  228  /*
d0ab89951197f0 Richard Fitzgerald 2026-01-21  229   * CS35L56 B0 SoundWire should ignore any SSIDExV2 suffix. It isn't needed
d0ab89951197f0 Richard Fitzgerald 2026-01-21  230   * on any products with B0 silicon and would interfere with the fallback
d0ab89951197f0 Richard Fitzgerald 2026-01-21  231   * to legacy naming convention for early B0-based laptops.
d0ab89951197f0 Richard Fitzgerald 2026-01-21  232   */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  233  static void cs35l56_test_l56_b0_ssidexv2_ignored_suffix_sdw(struct kunit *test)
d0ab89951197f0 Richard Fitzgerald 2026-01-21  234  {
d0ab89951197f0 Richard Fitzgerald 2026-01-21  235  	struct cs35l56_test_priv *priv = test->priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  236  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  237  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  238  	/* Set device type info */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  239  	cs35l56->base.type = 0x56;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  240  	cs35l56->base.rev = 0xb0;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  241  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  242  	/* Set the ALSA name prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21 @243  	cs35l56->component->name_prefix = "AMP1";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  244  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  245  	/* Set SoundWire link and UID number */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  246  	cs35l56->sdw_link_num = 1;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  247  	cs35l56->sdw_unique_id = 5;
d0ab89951197f0 Richard Fitzgerald 2026-01-21  248  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  249  	/* Set a SSID to enable lookup of SSIDExV2 */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  250  	snd_soc_card_set_pci_ssid(cs35l56->component->card, PCI_VENDOR_ID_DELL, 0x1234);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  251  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  252  	priv->ssidexv2 = "10281234_01_BB_CC";
d0ab89951197f0 Richard Fitzgerald 2026-01-21  253  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  254  	kunit_activate_static_stub(test,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  255  				   cs_amp_test_hooks->get_efi_variable,
d0ab89951197f0 Richard Fitzgerald 2026-01-21  256  				   cs35l56_test_get_efi_ssidexv2);
d0ab89951197f0 Richard Fitzgerald 2026-01-21  257  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  258  	KUNIT_EXPECT_EQ(test, 0, cs35l56_set_fw_suffix(cs35l56));
d0ab89951197f0 Richard Fitzgerald 2026-01-21  259  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  260  	/* Priority suffix should be the legacy ALSA prefix */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  261  	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.fwf_suffix, "AMP1");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  262  
d0ab89951197f0 Richard Fitzgerald 2026-01-21  263  	/* Fallback suffix should be the new SoundWire ID */
d0ab89951197f0 Richard Fitzgerald 2026-01-21  264  	KUNIT_EXPECT_STREQ(test, cs35l56->fallback_fw_suffix, "l1u5");
d0ab89951197f0 Richard Fitzgerald 2026-01-21  265  }
d0ab89951197f0 Richard Fitzgerald 2026-01-21  266  

:::::: The code at line 87 was first introduced by commit
:::::: d0ab89951197f0fc509a0cd732d830880e79c2d4 ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
