Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924E31A71B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 22:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7Dj+FdD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697842716; x=1729378716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sq1mWb6EtNFdRfEIFBn3SPCXRNTjpovHzErpUorga6M=;
  b=S7Dj+FdDGz6QwaHkvBNt8rJMWN2A2v81LdxN7dQEtpQZd0BTmNrUB8/z
   X9mYvenj+w/zRvj5pG4YabT62CzFVTv92Zg56lhFViT1oCvf4Ca4lkA0t
   Fa5RVLLVkFNdpuGvoiQf6UJnV8k0rG2GXEDs96SWFyUnSoUB7KimqADHi
   q4cZQH4k12kfdnMRv0Qzw0GWZAxd8WsY6s2q0KM/7AVGuEt/HiPcAm9Rd
   AV9Mn5oIrVk3gfHkVq+yM7C9kIMimJMiaXa5EwmxuEmU8Au3YFemi7lL8
   EvIfmfbRL5cAcdhoFKcAQ0g85f9P7pmkPvOi+TTKWZyQWOSK7jBOiLfCT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417720309"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417720309"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 15:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088877861"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="1088877861"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Oct 2023 15:58:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtyRr-00044A-0a;
	Fri, 20 Oct 2023 22:58:31 +0000
Date: Sat, 21 Oct 2023 06:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 2/43] checkpatch: WARNING:
 Missing or malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310210649.wEbnpzDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: fe21ca6269fd9836817f101b7b45c5d08f5b1a81 [2/43] xtensa: import ESP32S3 core variant
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210649.wEbnpzDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210649.wEbnpzDj-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#25: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:1:
+/*

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#33: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:9:
+/* Xtensa processor core configuration information.
+

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#53: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:29:
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#60: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:36:
+/****************************************************************************
+	    Parameters Useful for Any Code, USER or PRIVILEGED

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#70: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:46:
+/*----------------------------------------------------------------------
+				ISA

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#71: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:47:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#214: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:190:
+/*----------------------------------------------------------------------
+				MISC

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#215: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:191:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#222: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:198:
+#define XCHAL_DATA_PIPE_DELAY		1	/* d-side pipeline delay
+						   (1 = 5-stage, 2 = 7-stage) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#222: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:198:
+						   (1 = 5-stage, 2 = 7-stage) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#234: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:210:
+#define XCHAL_CORE_ID			"LX7_ESP32_S3_MP"	/* alphanum core name
+						   (CoreID) set in the Xtensa

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#235: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:211:
+						   Processor Generator */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#262: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:238:
+/*----------------------------------------------------------------------
+				CACHE

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#263: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:239:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#291: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:267:
+/****************************************************************************
+    Parameters Useful for PRIVILEGED (Supervisory or Non-Virtualized) Code

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#298: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:274:
+/*----------------------------------------------------------------------
+				CACHE

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#299: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:275:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#339: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:315:
+/*----------------------------------------------------------------------
+			INTERNAL I/D RAM/ROMs and XLMI

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#340: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:316:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#372: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:348:
+/*----------------------------------------------------------------------
+			INTERRUPTS and TIMERS

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#373: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:349:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#384: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:360:
+#define XCHAL_NUM_INTLEVELS		6	/* number of interrupt levels
+						   (not including level zero) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#384: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:360:
+						   (not including level zero) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#442: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:418:
+#define XCHAL_NMILEVEL			7	/* NMI "level" (for use with
+						   EXCSAVE/EPS/EPC_n, RFI n) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#442: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:418:
+						   EXCSAVE/EPS/EPC_n, RFI n) */

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#445: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:421:
+#define XCHAL_INT0_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#446: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:422:
+#define XCHAL_INT1_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#447: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:423:
+#define XCHAL_INT2_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#448: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:424:
+#define XCHAL_INT3_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#449: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:425:
+#define XCHAL_INT4_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#450: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:426:
+#define XCHAL_INT5_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#451: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:427:
+#define XCHAL_INT6_TYPE ^IXTHAL_INTTYPE_TIMER$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#452: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:428:
+#define XCHAL_INT7_TYPE ^IXTHAL_INTTYPE_SOFTWARE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#453: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:429:
+#define XCHAL_INT8_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#454: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:430:
+#define XCHAL_INT9_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#455: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:431:
+#define XCHAL_INT10_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#456: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:432:
+#define XCHAL_INT11_TYPE ^IXTHAL_INTTYPE_PROFILING$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#457: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:433:
+#define XCHAL_INT12_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#458: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:434:
+#define XCHAL_INT13_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#459: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:435:
+#define XCHAL_INT14_TYPE ^IXTHAL_INTTYPE_NMI$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#460: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:436:
+#define XCHAL_INT15_TYPE ^IXTHAL_INTTYPE_TIMER$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#461: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:437:
+#define XCHAL_INT16_TYPE ^IXTHAL_INTTYPE_TIMER$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#462: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:438:
+#define XCHAL_INT17_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#463: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:439:
+#define XCHAL_INT18_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#464: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:440:
+#define XCHAL_INT19_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#465: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:441:
+#define XCHAL_INT20_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#466: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:442:
+#define XCHAL_INT21_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#467: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:443:
+#define XCHAL_INT22_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#468: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:444:
+#define XCHAL_INT23_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#469: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:445:
+#define XCHAL_INT24_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#470: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:446:
+#define XCHAL_INT25_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#471: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:447:
+#define XCHAL_INT26_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#472: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:448:
+#define XCHAL_INT27_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#473: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:449:
+#define XCHAL_INT28_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#474: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:450:
+#define XCHAL_INT29_TYPE ^IXTHAL_INTTYPE_SOFTWARE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#475: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:451:
+#define XCHAL_INT30_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#476: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:452:
+#define XCHAL_INT31_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#570: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:546:
+/*----------------------------------------------------------------------
+			EXCEPTIONS and VECTORS

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#571: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:547:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#574: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:550:
+#define XCHAL_XEA_VERSION		2	/* Xtensa Exception Architecture
+						   number: 1 == XEA1 (old)

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#576: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:552:
+							   0 == XEAX (extern) or TX */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#640: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:616:
+/*----------------------------------------------------------------------
+				DEBUG MODULE

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#641: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:617:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#667: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:643:
+/*----------------------------------------------------------------------
+				MMU

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#668: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:644:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#680: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:656:
+#define XCHAL_HAVE_PTP_MMU		0	/* full MMU (with page table
+						   [autorefill] and protection)

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#681: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:657:
+						   usable for an MMU-based OS */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#690: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:666:
+/*----------------------------------------------------------------------
+				MPU

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#691: FILE: arch/xtensa/variants/esp32s3/include/variant/core.h:667:
+  ----------------------------------------------------------------------*/

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#712: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:1:
+/*

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#719: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:8:
+/* This header file contains assembly-language definitions (assembly
+   macros, etc.) for this specific Xtensa processor's TIE extensions

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#741: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:30:
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */

ERROR:SPACING: space required after that ',' (ctx:VxV)
#762: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:51:
+#define XTHAL_SAS3(optie,ccuse,abi)	( ((optie) & XTHAL_SAS_ANYOT)  \
                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#762: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:51:
+#define XTHAL_SAS3(optie,ccuse,abi)	( ((optie) & XTHAL_SAS_ANYOT)  \
                               ^

ERROR:SPACING: space prohibited after that open parenthesis '('
#762: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:51:
+#define XTHAL_SAS3(optie,ccuse,abi)	( ((optie) & XTHAL_SAS_ANYOT)  \

ERROR:SPACING: space prohibited before that close parenthesis ')'
#764: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:53:
+					| ((abi)   & XTHAL_SAS_ANYABI) )

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#768: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:57:
+    /*
+      *  Macro to store all non-coprocessor (extra) custom TIE and optional state

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#787: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                          ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#787: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#787: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                 ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#787: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                          ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#787: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                                              ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#790: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:79:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#795: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:84:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#800: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:89:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#807: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:96:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#812: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:101:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#827: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:116:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#834: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:123:
+    /*
+      *  Macro to load all non-coprocessor (extra) custom TIE and optional state

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#853: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:142:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#853: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:142:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                               ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#853: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:142:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#853: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:142:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#853: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:142:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                                             ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#856: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:145:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#861: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:150:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#866: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:155:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#873: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:162:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#878: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:167:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#893: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:182:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#912: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:201:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                              ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#912: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:201:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                    ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#912: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:201:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                     ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#912: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:201:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                              ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#912: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:201:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                                                  ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#915: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:204:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#938: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:227:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#954: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:243:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                             ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#954: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:243:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                   ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#954: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:243:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                    ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#954: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:243:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                             ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#954: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:243:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                                                 ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#957: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:246:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#980: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:269:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#997: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:286:
+    .macro	xchal_cp3_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                              ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#997: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:286:
+    .macro	xchal_cp3_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                    ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#997: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:286:
+    .macro	xchal_cp3_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                     ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#997: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:286:
+    .macro	xchal_cp3_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                              ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#997: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:286:
+    .macro	xchal_cp3_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                                                  ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1000: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:289:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1049: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:338:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1065: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:354:
+    .macro	xchal_cp3_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                             ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1065: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:354:
+    .macro	xchal_cp3_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                   ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1065: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:354:
+    .macro	xchal_cp3_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                    ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1065: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:354:
+    .macro	xchal_cp3_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                             ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1065: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:354:
+    .macro	xchal_cp3_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                                                 ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1068: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:357:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#1117: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:406:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:416:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1127: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:416:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1127: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:416:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1127: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:416:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1127: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:416:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:417:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1128: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:417:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1128: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:417:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1128: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:417:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1128: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:417:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:418:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1129: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:418:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1129: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:418:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1129: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:418:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1129: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:418:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:419:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1130: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:419:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1130: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:419:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1130: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:419:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1130: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:419:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:420:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1131: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:420:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1131: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:420:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1131: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:420:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1131: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:420:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:421:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1132: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:421:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1132: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:421:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1132: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:421:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1132: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:421:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:422:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1133: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:422:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1133: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:422:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1133: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:422:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1133: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:422:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:423:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1134: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:423:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1134: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:423:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1134: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:423:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1134: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:423:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:424:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1135: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:424:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1135: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:424:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1135: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:424:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1135: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:424:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:425:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1136: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:425:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1136: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:425:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1136: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:425:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1136: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:425:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:426:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1137: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:426:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1137: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:426:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1137: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:426:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1137: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:426:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:427:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1138: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:427:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1138: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:427:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1138: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:427:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1138: FILE: arch/xtensa/variants/esp32s3/include/variant/tie-asm.h:427:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1147: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:1:
+/*

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1154: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:8:
+/* This header file describes this specific Xtensa processor's TIE extensions
+   that extend basic Xtensa core functionality.  It is customized to this

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1176: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:30:
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1191: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:45:
+#define XCHAL_CP_ID_FPU             ^I0^I/* coprocessor ID (0..7) */$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1196: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:50:
+#define XCHAL_CP_ID_COP_AI          ^I3^I/* coprocessor ID (0..7) */$

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1261: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:115:
+#define XCHAL_NCP_SA_LIST(s)	\
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1262: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1263: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1264: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1265: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1266: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1267: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1268: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1269: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1270: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0)
                                                                         ^

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1273: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:127:
+#define XCHAL_CP0_SA_LIST(s)	\
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1274: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1275: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1276: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1277: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1279: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1280: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1281: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1282: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1283: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1284: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1285: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1286: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1287: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1288: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1289: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1290: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1291: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                         ^

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1300: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:154:
+#define XCHAL_CP3_SA_LIST(s)	\
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1301: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:155:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_0,16, 4, 4,0x0300,  ur,0  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1302: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:156:
+ XCHAL_SA_REG(s,0,0,1,0,         accx_1, 4, 4, 4,0x0301,  ur,1  ,  8,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1303: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:157:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_0, 4, 4, 4,0x0302,  ur,2  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1304: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:158:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_1, 4, 4, 4,0x0303,  ur,3  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1305: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:159:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_2, 4, 4, 4,0x0304,  ur,4  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1306: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:160:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_3, 4, 4, 4,0x0305,  ur,5  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1307: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:161:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_h_4, 4, 4, 4,0x0306,  ur,6  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1308: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:162:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_0, 4, 4, 4,0x0307,  ur,7  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1309: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:163:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_1, 4, 4, 4,0x0308,  ur,8  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1310: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:164:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_2, 4, 4, 4,0x0309,  ur,9  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1311: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:165:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_3, 4, 4, 4,0x030A,  ur,10 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1312: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:166:
+ XCHAL_SA_REG(s,0,0,1,0,       qacc_l_4, 4, 4, 4,0x030B,  ur,11 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1313: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:167:
+ XCHAL_SA_REG(s,0,0,1,0,       sar_byte, 4, 4, 4,0x030D,  ur,13 ,  4,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1314: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:168:
+ XCHAL_SA_REG(s,0,0,1,0,  fft_bit_width, 4, 4, 4,0x030E,  ur,14 ,  4,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:169:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_0, 4, 4, 4,0x030F,  ur,15 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1316: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:170:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_1, 4, 4, 4,0x0310,  ur,16 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1317: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:171:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_2, 4, 4, 4,0x0311,  ur,17 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1318: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:172:
+ XCHAL_SA_REG(s,0,0,1,0,     ua_state_3, 4, 4, 4,0x0312,  ur,18 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1319: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:173:
+ XCHAL_SA_REG(s,0,0,2,0,             q0,16,16,16,0x1008,   q,0  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1320: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:174:
+ XCHAL_SA_REG(s,0,0,2,0,             q1,16,16,16,0x1009,   q,1  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1321: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:175:
+ XCHAL_SA_REG(s,0,0,2,0,             q2,16,16,16,0x100A,   q,2  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1322: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:176:
+ XCHAL_SA_REG(s,0,0,2,0,             q3,16,16,16,0x100B,   q,3  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1323: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:177:
+ XCHAL_SA_REG(s,0,0,2,0,             q4,16,16,16,0x100C,   q,4  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1324: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:178:
+ XCHAL_SA_REG(s,0,0,2,0,             q5,16,16,16,0x100D,   q,5  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1325: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:179:
+ XCHAL_SA_REG(s,0,0,2,0,             q6,16,16,16,0x100E,   q,6  ,128,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:WxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1326: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:180:
+ XCHAL_SA_REG(s,0,0,2,0,             q7,16,16,16,0x100F,   q,7  ,128,0,0,0)
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
                                 	                             ^

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1341: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:195:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1343: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:197:
+#define XCHAL_BYTE0_FORMAT_LENGTHS	\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1344: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:198:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1345: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:199:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1346: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:200:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1347: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:201:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1348: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:202:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1349: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:203:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1350: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:204:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1351: FILE: arch/xtensa/variants/esp32s3/include/variant/tie.h:205:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,4,4
 	                                                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
