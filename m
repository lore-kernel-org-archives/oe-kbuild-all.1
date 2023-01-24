Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F10DEA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 05:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674539268; x=1706075268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OzWihTV77CXUJPR2F/JLCAMf2dU1W7zKj6fkn1qeVi4=;
  b=cEms7jQnE1ViH2/lP6/ElNm7bCcNNqhxr5qEwb6/gYHk3KCtsFpvZvjt
   cdicfsefA8moqvBttkp+gwVabAuB14Je5LpnTvioCQ3c57izkh+J3Z89w
   L2ZWEiJadUwbkDZcjBxVdNhurPeFYeUQdPkxotjXB6aevPZM3VFTpTjJl
   1EeU3nHcRt2OL1RRRC9lXfRD9Tl5RjkZ3mTvjDlI6povMtx5LNUfA8eZM
   50zOt+vFv/2MXHV9qRekErMUYSfUjEBryJOJdw8QjvKOsrHJ8HQCVvinI
   ur0wRdODmgcsMAIJlSmdHXGtKwz01FsS/cLUUlIPC/VbO7dxsKOewkNed
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306587577"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="306587577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 21:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="835859363"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="835859363"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Jan 2023 21:47:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKC9l-0006Au-0V;
	Tue, 24 Jan 2023 05:47:41 +0000
Date: Tue, 24 Jan 2023 13:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: George Prekas <george@enfabrica.net>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Lameter <cl@linux-foundation.org>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Andrei Vagin <avagin@gmail.com>,
	George Prekas <george@enfabrica.net>
Subject: Re: [PATCH 1/9] mm: kmemleak: properly disable task stack scanning
Message-ID: <202301241355.ytFzL2p6-lkp@intel.com>
References: <20230123170419.7292-2-george@enfabrica.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123170419.7292-2-george@enfabrica.net>

Hi George,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vbabka-slab/for-next]
[also build test WARNING on linus/master v6.2-rc5 next-20230123]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/George-Prekas/mm-kmemleak-properly-disable-task-stack-scanning/20230124-010911
base:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-next
patch link:    https://lore.kernel.org/r/20230123170419.7292-2-george%40enfabrica.net
patch subject: [PATCH 1/9] mm: kmemleak: properly disable task stack scanning
config: arc-randconfig-r043-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241355.ytFzL2p6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f0d9df4305849ecea4402bc614cadb0dd357da77
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review George-Prekas/mm-kmemleak-properly-disable-task-stack-scanning/20230124-010911
        git checkout f0d9df4305849ecea4402bc614cadb0dd357da77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/kmemleak.c: In function 'kmemleak_mark_stack':
>> mm/kmemleak.c:1244:46: warning: passing argument 1 of 'find_and_get_object' makes integer from pointer without a cast [-Wint-conversion]
    1244 |                 object = find_and_get_object(ptr, 0);
         |                                              ^~~
         |                                              |
         |                                              const void *
   mm/kmemleak.c:561:66: note: expected 'long unsigned int' but argument is of type 'const void *'
     561 | static struct kmemleak_object *find_and_get_object(unsigned long ptr, int alias)
         |                                                    ~~~~~~~~~~~~~~^~~


vim +/find_and_get_object +1244 mm/kmemleak.c

  1233	
  1234	/**
  1235	 * kmemleak_mark_stack - mark the allocated object as a kernel stack
  1236	 *
  1237	 * @ptr:	pointer to beginning of the object
  1238	 */
  1239	void __ref kmemleak_mark_stack(const void *ptr)
  1240	{
  1241		struct kmemleak_object *object;
  1242	
  1243		if (kmemleak_enabled && ptr && !IS_ERR(ptr)) {
> 1244			object = find_and_get_object(ptr, 0);
  1245			if (object) {
  1246				object->flags |= OBJECT_STACK;
  1247				put_object(object);
  1248			}
  1249		}
  1250	}
  1251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
