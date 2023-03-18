Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFC77C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 02:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679105970; x=1710641970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AT0rJFYu4PuPTGvHpMHJxTfa4Q2qECA1hPl9xUTpO28=;
  b=Bp2F1tD3AODJkhcoe8LeFsoh2ohS2XLdHUIIGoOBtnZ0HaTXixPi4eHb
   7ozUehqpbAFmytA4qFkIdSaCz2mVifg3WnUkz/bSo3DJ9EmK3piF7EhKw
   s1jgmflraRypuh79KSKjqCXUen3xwknuNFi6/PhgYwOnR8UiaWaN7MjAL
   hMSOt4rNCK6xUFFcpZ97PB7TZvbj1TntdvZ/WhxKO5ExOnVJ3TSVWDeC5
   dXeOYvh27/nF3ToEIyCLdK5HUst7BQCHWRT8S64+BOF1D7BRK/WfymKbK
   v+0Tyf1ecO4O5zGBrrJaijkFKMNZ1/u38FLrAm/+0j7ChvqC1xA5tIcDS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318054223"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="318054223"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 19:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769578585"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="769578585"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 19:19:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMAK-0009jK-12;
	Sat, 18 Mar 2023 02:19:28 +0000
Date: Sat, 18 Mar 2023 10:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20230317-module-alloc-opts 27/31]
 kernel/module/main.c:2217:13: warning: variable 'ret' set but not used
Message-ID: <202303181052.QqEXMgIQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20230317-module-alloc-opts
head:   68dfd11f7ebeb379312f4fc89c2792ce52d71ab4
commit: 139e5ac36c4aa1e28a51bf98a7304d3040c6da6b [27/31] module: add stop-grap sanity check on module memcpy()
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303181052.QqEXMgIQ-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=139e5ac36c4aa1e28a51bf98a7304d3040c6da6b
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof 20230317-module-alloc-opts
        git checkout 139e5ac36c4aa1e28a51bf98a7304d3040c6da6b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash kernel/module/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181052.QqEXMgIQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/module/main.c: In function 'move_module':
>> kernel/module/main.c:2217:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2217 |         int ret = -ENOMEM;
         |             ^~~


vim +/ret +2217 kernel/module/main.c

  2211	
  2212	static int move_module(struct module *mod, struct load_info *info)
  2213	{
  2214		int i;
  2215		void *ptr;
  2216		enum mod_mem_type t;
> 2217		int ret = -ENOMEM;
  2218	
  2219		for_each_mod_mem_type(type) {
  2220			if (!mod->mem[type].size) {
  2221				mod->mem[type].base = NULL;
  2222				continue;
  2223			}
  2224			mod->mem[type].size = PAGE_ALIGN(mod->mem[type].size);
  2225			ptr = module_memory_alloc(mod->mem[type].size, type);
  2226	
  2227			/*
  2228			 * The pointer to this block is stored in the module structure
  2229			 * which is inside the block. Just mark it as not being a
  2230			 * leak.
  2231			 */
  2232			kmemleak_ignore(ptr);
  2233			if (!ptr) {
  2234				t = type;
  2235				goto out_enomem;
  2236			}
  2237			memset(ptr, 0, mod->mem[type].size);
  2238			mod->mem[type].base = ptr;
  2239		}
  2240	
  2241		/* Transfer each section which specifies SHF_ALLOC */
  2242		pr_debug("final section addresses:\n");
  2243		for (i = 0; i < info->hdr->e_shnum; i++) {
  2244			void *dest;
  2245			Elf_Shdr *shdr = &info->sechdrs[i];
  2246			enum mod_mem_type type = shdr->sh_entsize >> SH_ENTSIZE_TYPE_SHIFT;
  2247	
  2248			if (!(shdr->sh_flags & SHF_ALLOC))
  2249				continue;
  2250	
  2251			dest = mod->mem[type].base + (shdr->sh_entsize & SH_ENTSIZE_OFFSET_MASK);
  2252	
  2253			if (shdr->sh_type != SHT_NOBITS) {
  2254				/*
  2255				 * Our ELF checker already validated this, but let's
  2256				 * be pedantic and make the goal clearer. We actually
  2257				 * end up copying over all modifications made to the
  2258				 * userspace copy of the entire struct module.
  2259				 */
  2260				if (i == info->index.mod &&
  2261				   (WARN_ON_ONCE(shdr->sh_size != sizeof(struct module)))) {
  2262					ret = -ENOEXEC;
  2263					goto out_enomem;
  2264				}
  2265				memcpy(dest, (void *)shdr->sh_addr, shdr->sh_size);
  2266			}
  2267			/*
  2268			 * Update the userspace copy's ELF section address to point to
  2269			 * our newly allocated memory as a pure convenience so that
  2270			 * users of info can keep taking advantage and using the newly
  2271			 * minted official memory area.
  2272			 */
  2273			shdr->sh_addr = (unsigned long)dest;
  2274			pr_debug("\t0x%lx %s\n",
  2275				 (long)shdr->sh_addr, info->secstrings + shdr->sh_name);
  2276		}
  2277	
  2278		return 0;
  2279	out_enomem:
  2280		for (t--; t >= 0; t--)
  2281			module_memory_free(mod->mem[t].base, t);
  2282		return -ENOMEM;
  2283	}
  2284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
