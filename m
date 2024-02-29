Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0979316FF4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709248654; cv=none; b=YcIZjme393ujSFqb0pO8CR7zxVLZvoJmjdRs+rwbMQ2tBZfTkmAPDaDg/H6RS/HlWw0Ws9vCnPjNogyuoFnyTJEVZsR0ekOtfedCtV7SAwJWWJq+Nf/jMTcOELWKwZuhS0AD3wvyPs6bsN8eK5782P7Yb3tTodAjlChgr/xwu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709248654; c=relaxed/simple;
	bh=O7aEeHsIl6NBdrBE6Qlw6Hnlvd+E0DSlMFyTqEUty2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKgDOlRQ2/mk3o5z2IvN3UiARKJjfDVRqz5cybL5OlzokSZwjdaSFcfHFGS/uENZEkJxbYCkVGu5w2W1fR/qsF73sO7iuW9PqqTr4tbA3sOop8ctPQKcGL+L+Lu2AsToSojab1pyTjl0oomE7jMuDvtCED0kUfwm3vwHoQntA+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h41ycRVR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h41ycRVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709248652; x=1740784652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7aEeHsIl6NBdrBE6Qlw6Hnlvd+E0DSlMFyTqEUty2U=;
  b=h41ycRVRWh0Q/HwLwtqmhV6p+/QjgT3ptzU1tsD5Ux/KcL7KTEjEQnQM
   Jj6Jlt5zoaqpLNaLF5rF0KJXT3aqr90nUxOINHpKOahpT/XKPZ/Fm+qN3
   zno45pIVxQtcC3BJ4mue8cPFW0TDGLzoPeMreJ7uJTNU3mmJskXIL89+7
   Qj23J94aAX62hWXCh1WzxDP1DYVOjpjFzgjMeoFtfYPXxzMoLE0BgXXUg
   b+RFX/cmVh6wgGRuC0cQ842lgav5pQM86uuieeYPY0XiCZz6yYe/4nvSU
   s+cAyLxoVr6z4Mfur4e/H0lSxtbdxRs1q2a9QtrGy5TL3W29s39e7AuAL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7586145"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7586145"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 15:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8409995"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Feb 2024 15:17:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfpeH-000DLj-0x;
	Thu, 29 Feb 2024 23:17:17 +0000
Date: Fri, 1 Mar 2024 07:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:5.4-main 1537/26479] <command-line>: error:
 redeclaration of enumerator 'IEEE80211_HW_REPORTS_TX_ACK_STATUS'
Message-ID: <202403010706.Laiaa5Zf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   38792835905dee67ae3688fb269f46a327e86814
commit: bdfab89b8dada94f63f56210817f1376c7fd5dca [1537/26479] mt76: update driver from openwrt to include mt7622 wifi
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010706.Laiaa5Zf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010706.Laiaa5Zf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010706.Laiaa5Zf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from drivers/net/wireless/mediatek/mt76_new/mt76.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/mmio.c:6:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/mm.h:99,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from drivers/net/wireless/mediatek/mt76_new/dma.c:6:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/dma.c: In function 'mt76_dma_rx_fill':
   drivers/net/wireless/mediatek/mt76_new/dma.c:368:13: error: variable 'idx' set but not used [-Werror=unused-but-set-variable]
     368 |         int idx;
         |             ^~~
   cc1: all warnings being treated as errors
--
   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from drivers/net/wireless/mediatek/mt76_new/pci.c:6:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c: At top level:
   drivers/net/wireless/mediatek/mt76_new/pci.c:8:6: error: no previous prototype for 'mt76_pci_disable_aspm' [-Werror=missing-prototypes]
       8 | void mt76_pci_disable_aspm(struct pci_dev *pdev)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c: In function 'mt76_pci_disable_aspm':
   drivers/net/wireless/mediatek/mt76_new/pci.c:31:6: error: "LINUX_VERSION_CODE" is not defined, evaluates to 0 [-Werror=undef]
      31 | #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c:31:28: error: "KERNEL_VERSION" is not defined, evaluates to 0 [-Werror=undef]
      31 | #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
         |                            ^~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76_new/pci.c:31:42: error: missing binary operator before token "("
      31 | #if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,0,0))
         |                                          ^
   cc1: all warnings being treated as errors
--
   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from arch/parisc/include/asm/hardirq.h:13,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from include/linux/pci.h:38,
                    from drivers/net/wireless/mediatek/mt76_new/mt7603/pci.c:5:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   include/net/mac80211.h: At top level:
>> <command-line>: error: redeclaration of enumerator 'IEEE80211_HW_REPORTS_TX_ACK_STATUS'
   include/net/mac80211.h:2335:9: note: in expansion of macro 'IEEE80211_HW_TX_STATUS_NO_AMPDU_LEN'
    2335 |         IEEE80211_HW_TX_STATUS_NO_AMPDU_LEN,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76_new/mt7603/../mt76.h:16,
                    from drivers/net/wireless/mediatek/mt76_new/mt7603/mt7603.h:8,
                    from drivers/net/wireless/mediatek/mt76_new/mt7603/pci.c:7:
   include/net/mac80211.h:2306:9: note: previous definition of 'IEEE80211_HW_REPORTS_TX_ACK_STATUS' with type 'int'
    2306 |         IEEE80211_HW_REPORTS_TX_ACK_STATUS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from drivers/net/wireless/mediatek/mt76_new/mt76.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/trace.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/trace.c:10:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76_new/trace.h:61:
   include/trace/define_trace.h: At top level:
   include/trace/define_trace.h:95:42: fatal error: ./trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   cc1: all warnings being treated as errors
   compilation terminated.
--
   In file included from include/linux/mm.h:99,
                    from include/linux/scatterlist.h:8,
                    from include/linux/kfifo.h:42,
                    from drivers/net/wireless/mediatek/mt76_new/mt76x02.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/mt76x02_trace.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/mt76x02_trace.c:10:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76_new/mt76x02_trace.h:133:
   include/trace/define_trace.h: At top level:
   include/trace/define_trace.h:95:42: fatal error: ./mt76x02_trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   cc1: all warnings being treated as errors
   compilation terminated.
--
   In file included from arch/parisc/include/asm/io.h:6,
                    from include/linux/io.h:13,
                    from drivers/net/wireless/mediatek/mt76_new/mt76.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/usb_trace.h:10,
                    from drivers/net/wireless/mediatek/mt76_new/usb_trace.c:10:
   include/asm-generic/pgtable.h: In function 'pte_clear_not_present_full':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   arch/parisc/include/asm/pgtable.h:316:34: note: in expansion of macro 'set_pte_at'
     316 | #define pte_clear(mm, addr, xp)  set_pte_at(mm, addr, xp, __pte(0))
         |                                  ^~~~~~~~~~
   include/asm-generic/pgtable.h:201:9: note: in expansion of macro 'pte_clear'
     201 |         pte_clear(mm, address, ptep);
         |         ^~~~~~~~~
   include/asm-generic/pgtable.h: In function '__ptep_modify_prot_commit':
>> arch/parisc/include/asm/pgtable.h:91:23: error: variable 'old_pte' set but not used [-Werror=unused-but-set-variable]
      91 |                 pte_t old_pte;                                  \
         |                       ^~~~~~~
   include/asm-generic/pgtable.h:629:9: note: in expansion of macro 'set_pte_at'
     629 |         set_pte_at(vma->vm_mm, addr, ptep, pte);
         |         ^~~~~~~~~~
   In file included from drivers/net/wireless/mediatek/mt76_new/usb_trace.h:86:
   include/trace/define_trace.h: At top level:
   include/trace/define_trace.h:95:42: fatal error: ./usb_trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   cc1: all warnings being treated as errors
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
