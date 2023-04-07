Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E0BA46
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 01:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680832464; x=1712368464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c6J9H6ub79E39qJDSJzyavQZ4u/78yGv7HPc1c95TPk=;
  b=XXzzA+uyT86GEVwgNpB0D0aO9bcpWznyVAdRWRkM/2ssr8r6inFoAw4u
   gWYGIAI+nsj7EFXJEh2rOV3l9V3v5q5MQgoWe84weAsBEiwKE7HuaJ1uA
   +ev/sJeXA8zoUoZVYIUzQaOCNpBd+LKAICajAJHN3T1v9HpPDdTohqSNs
   sBEKJ4ESMPyxftSR4hDkjKtHXwp2/i2JoXAeS/Q/Q6hNyjeZE8nSDtKlt
   eKZFEgFx3j4UzAG5QlTBVD5FAV2ujqt+WEBbsPS7BRXl/6z5JBgHBnkIR
   hjfAy2ygvquTBqgTWb0pQx3JQ/wKBo0L4845yIVvDQuT3bEAov+qR15yt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326965104"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="326965104"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751871756"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="751871756"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 18:54:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkbJ0-000Rzy-15;
	Fri, 07 Apr 2023 01:54:22 +0000
Date: Fri, 7 Apr 2023 09:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/5] mm/mmap.c:750:5: warning: no
 previous prototype for function '__vma_adjust'
Message-ID: <202304070900.nY7tJ4wO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   2527b21f3323b457872a633a3554ec9579438387
commit: 91a2fd68b349bd374ae9f398b09726267adfd22f [4/5] ANDROID: Revert "mm/mmap: remove __vma_adjust()"
config: i386-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070900.nY7tJ4wO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-mainline
        git checkout 91a2fd68b349bd374ae9f398b09726267adfd22f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070900.nY7tJ4wO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmap.c:750:5: warning: no previous prototype for function '__vma_adjust' [-Wmissing-prototypes]
   int __vma_adjust(struct vma_iterator *vmi, struct vm_area_struct *vma,
       ^
   mm/mmap.c:750:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __vma_adjust(struct vma_iterator *vmi, struct vm_area_struct *vma,
   ^
   static 
   1 warning generated.


vim +/__vma_adjust +750 mm/mmap.c

   742	
   743	/*
   744	 * We cannot adjust vm_start, vm_end, vm_pgoff fields of a vma that
   745	 * is already present in an i_mmap tree without adjusting the tree.
   746	 * The following helper function should be used when such adjustments
   747	 * are necessary.  The "insert" vma (if any) is to be inserted
   748	 * before we drop the necessary locks.
   749	 */
 > 750	int __vma_adjust(struct vma_iterator *vmi, struct vm_area_struct *vma,
   751		unsigned long start, unsigned long end, pgoff_t pgoff,
   752		struct vm_area_struct *expand)
   753	{
   754		struct mm_struct *mm = vma->vm_mm;
   755		struct vm_area_struct *remove2 = NULL;
   756		struct vm_area_struct *remove = NULL;
   757		struct vm_area_struct *next = find_vma(mm, vma->vm_end);
   758		struct vm_area_struct *orig_vma = vma;
   759		struct file *file = vma->vm_file;
   760		bool vma_changed = false;
   761		long adjust_next = 0;
   762		struct vma_prepare vma_prep;
   763	
   764		if (next) {
   765			int error = 0;
   766	
   767			if (end >= next->vm_end) {
   768				/*
   769				 * vma expands, overlapping all the next, and
   770				 * perhaps the one after too (mprotect case 6).
   771				 * The only other cases that gets here are
   772				 * case 1, case 7 and case 8.
   773				 */
   774				if (next == expand) {
   775					/*
   776					 * The only case where we don't expand "vma"
   777					 * and we expand "next" instead is case 8.
   778					 */
   779					VM_WARN_ON(end != next->vm_end);
   780					/*
   781					 * we're removing "vma" and that to do so we
   782					 * swapped "vma" and "next".
   783					 */
   784					VM_WARN_ON(file != next->vm_file);
   785					swap(vma, next);
   786					remove = next;
   787				} else {
   788					VM_WARN_ON(expand != vma);
   789					/*
   790					 * case 1, 6, 7, remove next.
   791					 * case 6 also removes the one beyond next
   792					 */
   793					remove = next;
   794					if (end > next->vm_end)
   795						remove2 = find_vma(mm, next->vm_end);
   796	
   797					VM_WARN_ON(remove2 != NULL &&
   798						   end != remove2->vm_end);
   799				}
   800	
   801				/*
   802				 * If next doesn't have anon_vma, import from vma after
   803				 * next, if the vma overlaps with it.
   804				 */
   805				if (remove != NULL && !next->anon_vma)
   806					error = dup_anon_vma(vma, remove2);
   807				else
   808					error = dup_anon_vma(vma, remove);
   809	
   810			} else if (end > next->vm_start) {
   811				/*
   812				 * vma expands, overlapping part of the next:
   813				 * mprotect case 5 shifting the boundary up.
   814				 */
   815				adjust_next = (end - next->vm_start);
   816				VM_WARN_ON(expand != vma);
   817				error = dup_anon_vma(vma, next);
   818			} else if (end < vma->vm_end) {
   819				/*
   820				 * vma shrinks, and !insert tells it's not
   821				 * split_vma inserting another: so it must be
   822				 * mprotect case 4 shifting the boundary down.
   823				 */
   824				adjust_next = -(vma->vm_end - end);
   825				VM_WARN_ON(expand != next);
   826				error = dup_anon_vma(next, vma);
   827			}
   828			if (error)
   829				return error;
   830		}
   831	
   832		if (vma_iter_prealloc(vmi))
   833			return -ENOMEM;
   834	
   835		vma_adjust_trans_huge(orig_vma, start, end, adjust_next);
   836	
   837		init_multi_vma_prep(&vma_prep, vma, adjust_next ? next : NULL, remove,
   838				    remove2);
   839		VM_WARN_ON(vma_prep.anon_vma && adjust_next && next->anon_vma &&
   840			   vma_prep.anon_vma != next->anon_vma);
   841	
   842		vma_prepare(&vma_prep);
   843	
   844		if (start < vma->vm_start || end > vma->vm_end)
   845			vma_changed = true;
   846	
   847		vma->vm_start = start;
   848		vma->vm_end = end;
   849		vma->vm_pgoff = pgoff;
   850	
   851		if (vma_changed)
   852			vma_iter_store(vmi, vma);
   853	
   854		if (adjust_next) {
   855			next->vm_start += adjust_next;
   856			next->vm_pgoff += adjust_next >> PAGE_SHIFT;
   857			if (adjust_next < 0) {
   858				WARN_ON_ONCE(vma_changed);
   859				vma_iter_store(vmi, next);
   860			}
   861		}
   862	
   863		vma_complete(&vma_prep, vmi, mm);
   864		vma_iter_free(vmi);
   865		validate_mm(mm);
   866	
   867		return 0;
   868	}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
