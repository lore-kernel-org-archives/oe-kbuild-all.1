Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415987F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694661836; x=1726197836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fCZU1m6HBwgXTGzJvhlMIJj38p5Ve8OiTlawBnw9qe4=;
  b=hczD4SjIbrxV/hS12g3JC11TZ+kD1ueSQglCF1oSylQfpej7O8Fq/Ejo
   TWzGj2K7Hc20b6j8uLdgr12ukUQa/0vz+B5iq+9bHqFd5OHykXvAHGWWh
   IEbLOMwwIEJRk0RU7mvdZ42gf2UweZQvEzt9waFglyPdgDh+tEjZr/CbI
   VEdZEogC6ZhdWNF1nT+1bvW5OCeerk3y4BSl4YHgUyE0NZfCUJhzSfu3W
   nrqHag5g4pE9UJNTzJsU8g/ln5JPKqBybHQ37VEYquNQLukQ0cwrS1a6G
   zuJdyot+/HVA0e0ylMhVxi4tSMJsCIPTs7d/lpK9K6iitcdv4ZPYlSSK8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378765125"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="378765125"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="694081084"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="694081084"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 20:23:53 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgcxK-00015B-35;
	Thu, 14 Sep 2023 03:23:50 +0000
Date: Thu, 14 Sep 2023 11:23:20 +0800
From: kernel test robot <lkp@intel.com>
To: cujomalainey@chromium.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/2] ALSA: core: split control primitives out of
 snd_card
Message-ID: <202309141104.DHbZ71pf-lkp@intel.com>
References: <20230913200846.1894258-3-cujomalainey@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913200846.1894258-3-cujomalainey@chromium.org>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cujomalainey-chromium-org/ALSA-core-split-control-primitives-out-of-snd_card/20230914-041536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230913200846.1894258-3-cujomalainey%40chromium.org
patch subject: [RFC PATCH v2 2/2] ALSA: core: split control primitives out of snd_card
config: x86_64-randconfig-001-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141104.DHbZ71pf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141104.DHbZ71pf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141104.DHbZ71pf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:21,
                    from include/linux/interrupt.h:6,
                    from sound/core/control.c:8:
   sound/core/control.c: In function 'snd_ctl_find_numid_slow':
>> sound/core/control.c:874:33: error: 'struct snd_card' has no member named 'controls'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |                                 ^~
   include/linux/container_of.h:19:26: note: in definition of macro 'container_of'
      19 |  void *__mptr = (void *)(ptr);     \
         |                          ^~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     612 |  list_entry((ptr)->next, type, member)
         |  ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     770 |  for (pos = list_first_entry(head, typeof(*pos), member); \
         |             ^~~~~~~~~~~~~~~~
   sound/core/control.c:874:2: note: in expansion of macro 'list_for_each_entry'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |  ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from include/linux/interrupt.h:6,
                    from sound/core/control.c:8:
>> sound/core/control.c:874:33: error: 'struct snd_card' has no member named 'controls'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |                                 ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     601 |  container_of(ptr, type, member)
         |  ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     612 |  list_entry((ptr)->next, type, member)
         |  ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     770 |  for (pos = list_first_entry(head, typeof(*pos), member); \
         |             ^~~~~~~~~~~~~~~~
   sound/core/control.c:874:2: note: in expansion of macro 'list_for_each_entry'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |  ^~~~~~~~~~~~~~~~~~~
>> sound/core/control.c:874:33: error: 'struct snd_card' has no member named 'controls'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |                                 ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:21:9: note: in expansion of macro '__same_type'
      21 |         __same_type(*(ptr), void),   \
         |         ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     601 |  container_of(ptr, type, member)
         |  ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     612 |  list_entry((ptr)->next, type, member)
         |  ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     770 |  for (pos = list_first_entry(head, typeof(*pos), member); \
         |             ^~~~~~~~~~~~~~~~
   sound/core/control.c:874:2: note: in expansion of macro 'list_for_each_entry'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:366:27: error: expression in static assertion is not an integer
     366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |  ^~~~~~~~~~~~~
   include/linux/container_of.h:20:16: note: in expansion of macro '__same_type'
      20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
         |                ^~~~~~~~~~~
   include/linux/list.h:601:2: note: in expansion of macro 'container_of'
     601 |  container_of(ptr, type, member)
         |  ^~~~~~~~~~~~
   include/linux/list.h:612:2: note: in expansion of macro 'list_entry'
     612 |  list_entry((ptr)->next, type, member)
         |  ^~~~~~~~~~
   include/linux/list.h:770:13: note: in expansion of macro 'list_first_entry'
     770 |  for (pos = list_first_entry(head, typeof(*pos), member); \
         |             ^~~~~~~~~~~~~~~~
   sound/core/control.c:874:2: note: in expansion of macro 'list_for_each_entry'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |  ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/preempt.h:12,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from sound/core/control.c:8:
>> sound/core/control.c:874:33: error: 'struct snd_card' has no member named 'controls'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |                                 ^~
   include/linux/list.h:761:20: note: in definition of macro 'list_entry_is_head'
     761 |  (&pos->member == (head))
         |                    ^~~~
   sound/core/control.c:874:2: note: in expansion of macro 'list_for_each_entry'
     874 |  list_for_each_entry(kctl, &card->controls, list) {
         |  ^~~~~~~~~~~~~~~~~~~


vim +874 sound/core/control.c

966f015fe43291 Maciej S. Szmigiero 2022-10-20  867  
c27e1efb61c545 Takashi Iwai        2022-06-10  868  #ifndef CONFIG_SND_CTL_FAST_LOOKUP
c27e1efb61c545 Takashi Iwai        2022-06-10  869  static struct snd_kcontrol *
c27e1efb61c545 Takashi Iwai        2022-06-10  870  snd_ctl_find_numid_slow(struct snd_card *card, unsigned int numid)
c27e1efb61c545 Takashi Iwai        2022-06-10  871  {
c27e1efb61c545 Takashi Iwai        2022-06-10  872  	struct snd_kcontrol *kctl;
c27e1efb61c545 Takashi Iwai        2022-06-10  873  
c27e1efb61c545 Takashi Iwai        2022-06-10 @874  	list_for_each_entry(kctl, &card->controls, list) {
c27e1efb61c545 Takashi Iwai        2022-06-10  875  		if (kctl->id.numid <= numid && kctl->id.numid + kctl->count > numid)
c27e1efb61c545 Takashi Iwai        2022-06-10  876  			return kctl;
c27e1efb61c545 Takashi Iwai        2022-06-10  877  	}
c27e1efb61c545 Takashi Iwai        2022-06-10  878  	return NULL;
c27e1efb61c545 Takashi Iwai        2022-06-10  879  }
c27e1efb61c545 Takashi Iwai        2022-06-10  880  #endif /* !CONFIG_SND_CTL_FAST_LOOKUP */
c27e1efb61c545 Takashi Iwai        2022-06-10  881  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
