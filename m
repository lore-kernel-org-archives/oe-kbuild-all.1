Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2917B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678540373; x=1710076373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MT4VLeZhSUMXvLPWgpQHIQE56S+l+WY1DnFT7YLvWrs=;
  b=LKGDqn2SNyWxm4BhCAr+5467YlC/glZNSCauXjqu8kAsJqPyMVp1KWvy
   i9IkWndQVweD2okjZr9d3u8k8Jp6ghT4GwJpWoO9bZBzPfksRru+FaH2H
   NGrI1egsd+I7YnldUFj7SDupJL24HXki1inFj7Waw14aOoiHpj6koot3w
   XF2z9j8R89ZKh07n9sauNKeNNRS5lWbW+Nf/wKWGzHmxvgHLFlsS4LVH8
   mXifvEm6GD99I7jeZMKmiwotZrd6HU5aqTZTbD63Yf7qvAAxpc1SX4hQj
   SYTGwIz7G5XPaEaNO0H4qdd4Oy1bByCw2AWas7DRkjXfFfHJgI2xw3IUB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335601881"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="335601881"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 05:12:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678148465"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="678148465"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Mar 2023 05:12:51 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paz1n-0004a5-0s;
	Sat, 11 Mar 2023 13:12:51 +0000
Date: Sat, 11 Mar 2023 21:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 12/12] module: use aliases to find module on
 find_module_all()
Message-ID: <202303112006.6QfJxFRY-lkp@intel.com>
References: <20230311051712.4095040-13-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311051712.4095040-13-mcgrof@kernel.org>

Hi Luis,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Chamberlain/module-use-goto-errors-on-check_modinfo-and-layout_and_allocate/20230311-131905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230311051712.4095040-13-mcgrof%40kernel.org
patch subject: [RFC 12/12] module: use aliases to find module on find_module_all()
config: parisc-randconfig-r002-20230310 (https://download.01.org/0day-ci/archive/20230311/202303112006.6QfJxFRY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d92029475386e6bbbea10a2f56a87d37e61a2b38
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luis-Chamberlain/module-use-goto-errors-on-check_modinfo-and-layout_and_allocate/20230311-131905
        git checkout d92029475386e6bbbea10a2f56a87d37e61a2b38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303112006.6QfJxFRY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/main.c: In function 'module_name_match':
>> kernel/module/main.c:351:26: error: 'struct module' has no member named 'num_aliases'
     351 |         for (i=0; i < mod->num_aliases; i++) {
         |                          ^~
>> kernel/module/main.c:352:28: error: 'struct module' has no member named 'aliases'
     352 |                 alias = mod->aliases[i];
         |                            ^~


vim +351 kernel/module/main.c

   340	
   341	static bool module_name_match(struct module *mod, const char *name, size_t len)
   342	{
   343		unsigned int i;
   344		const char *alias;
   345	
   346		if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
   347			return true;
   348	
   349		return module_name_match_aliases(mod, name, len);
   350	
 > 351		for (i=0; i < mod->num_aliases; i++) {
 > 352			alias = mod->aliases[i];
   353			if (strlen(alias) == len && !memcmp(alias, name, len)) {
   354				pr_debug("module %s alias matched: alias[%u] = %s\n",
   355					 mod->name, i, alias);
   356				return true;
   357			}
   358		}
   359	
   360		return false;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
