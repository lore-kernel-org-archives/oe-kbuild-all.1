Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE97210EF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695740327; x=1727276327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZuJFV1smnx3II+uRznIJXmLvkdcOIU7qQC5Yu7qUnU=;
  b=Z8lb9pmLXb2tT3HKUKqOosmOK8z05FqELXSrFU61PBqcZfUtFZa1tKn1
   E9ZguN+j2jiQa+UjxYCCokykWYK7Wmx2wkBgvJmJ//ftbBw9Cq4CaEm5+
   LhlNTW+Lh9shijurHgcXvPgiuFj3PW/FtCIlbzs9EVuCAfpNZFROxMAc/
   ohrLiaPyOMJWrnXLaNd/H2Yp8yXbtWDd+H78n8pEPQi4P1yo0hyLNt/il
   LeW/fkk+4rsxQhQXTuyry0buaQertskwxDh3elAKW3zcO9GnDqQ7mMWD2
   0vYMqxOD3s+dhQDogHVrTVZnZsn9yz9Kk/pRTwiANQXR2oGOjZBWYqC/s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366644803"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="366644803"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 07:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864428598"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864428598"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 07:58:37 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql9WE-0002xX-2q;
	Tue, 26 Sep 2023 14:58:34 +0000
Date: Tue, 26 Sep 2023 22:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 9/11] arch/x86/coco/tdx/tdx.c:723:6: warning:
 no previous prototype for 'tdx_enc_status_changed'
Message-ID: <202309262206.14xpEAlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   e6cbe6d2179df6f04d4423a4e6578adb438bed1d
commit: 9af52ee1ced044d0b348137877cb1605af93960c [9/11] x86/tdx: Convert shared memory back to private on kexec
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309262206.14xpEAlC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309262206.14xpEAlC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309262206.14xpEAlC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:723:6: warning: no previous prototype for 'tdx_enc_status_changed' [-Wmissing-prototypes]
     723 | bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/tdx_enc_status_changed +723 arch/x86/coco/tdx/tdx.c

   717	
   718	/*
   719	 * Inform the VMM of the guest's intent for this physical page: shared with
   720	 * the VMM or private to the guest.  The VMM is expected to change its mapping
   721	 * of the page in response.
   722	 */
 > 723	bool tdx_enc_status_changed(unsigned long vaddr, int numpages, bool enc)
   724	{
   725		phys_addr_t start = __pa(vaddr);
   726		phys_addr_t end   = __pa(vaddr + numpages * PAGE_SIZE);
   727	
   728		if (!enc) {
   729			/* Set the shared (decrypted) bits: */
   730			start |= cc_mkdec(0);
   731			end   |= cc_mkdec(0);
   732		}
   733	
   734		/*
   735		 * Notify the VMM about page mapping conversion. More info about ABI
   736		 * can be found in TDX Guest-Host-Communication Interface (GHCI),
   737		 * section "TDG.VP.VMCALL<MapGPA>"
   738		 */
   739		if (_tdx_hypercall(TDVMCALL_MAP_GPA, start, end - start, 0, 0))
   740			return false;
   741	
   742		/* shared->private conversion requires memory to be accepted before use */
   743		if (enc)
   744			return tdx_accept_memory(start, end);
   745	
   746		return true;
   747	}
   748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
