Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DF1A71B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 22:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdPNqO10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697842657; x=1729378657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oxO6UcqHAcAO93bQB0/tjlkRt5zTq38qnSxYilkpcNw=;
  b=HdPNqO10nkZvciAzhtU/FL2ATLLfjECbO0a1316LkBcwp21VVO+JGQBq
   PiydSeksxYrhMV3TI1Zdjgm0tlJFU2aCGOiNRl11iifrN9EklKGtGWX2L
   RLoqyaDxRp3wZI4EstmHnprV9olTGGUk5Vudk2RnutFipWgKybA2wKHNu
   1pay21GUiGGo35NH/nw7CeFsK/jEH8VhOAmcA2E+q9TNCAWi5doBLTHQC
   uWGe5pS8KBriInqSo5H3KNlgW0U08f6HnZAKmk7+bLyp0rsuy28WNcrdu
   VFlV66xMKOVMSDQOR1TX/+GXD6IwR00h8ogIM8NTdn+FFhXg1QbJ0CReZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371656288"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371656288"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 15:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1004730891"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="1004730891"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Oct 2023 15:57:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtyQt-000445-0U;
	Fri, 20 Oct 2023 22:57:31 +0000
Date: Sat, 21 Oct 2023 06:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 1/43] checkpatch: ERROR:
 trailing whitespace
Message-ID: <202310210602.UcpgW4pO-lkp@intel.com>
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
commit: 4d7dbb27a0fb9cc6c28b40e4e8f7a2bf1b9768a0 [1/43] xtensa: import ESP32 core variant
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210602.UcpgW4pO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210602.UcpgW4pO-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#25: FILE: arch/xtensa/variants/esp32/include/variant/core.h:1:
+/* $

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#25: FILE: arch/xtensa/variants/esp32/include/variant/core.h:1:
+/* 

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#33: FILE: arch/xtensa/variants/esp32/include/variant/core.h:9:
+/* Xtensa processor core configuration information.
+

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#53: FILE: arch/xtensa/variants/esp32/include/variant/core.h:29:
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#60: FILE: arch/xtensa/variants/esp32/include/variant/core.h:36:
+/****************************************************************************
+	    Parameters Useful for Any Code, USER or PRIVILEGED

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#70: FILE: arch/xtensa/variants/esp32/include/variant/core.h:46:
+/*----------------------------------------------------------------------
+				ISA

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#71: FILE: arch/xtensa/variants/esp32/include/variant/core.h:47:
+  ----------------------------------------------------------------------*/

ERROR:TRAILING_WHITESPACE: trailing whitespace
#140: FILE: arch/xtensa/variants/esp32/include/variant/core.h:116:
+#define XCHAL_HAVE_HIFI_MINI^I^I0^I$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#159: FILE: arch/xtensa/variants/esp32/include/variant/core.h:135:
+#define XCHAL_HAVE_DFPU_SINGLE_ONLY    1                 ^I/* DFPU Coprocessor, single precision only */$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#160: FILE: arch/xtensa/variants/esp32/include/variant/core.h:136:
+#define XCHAL_HAVE_DFPU_SINGLE_DOUBLE  0               ^I/* DFPU Coprocessor, single and double precision */$

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#183: FILE: arch/xtensa/variants/esp32/include/variant/core.h:159:
+/*----------------------------------------------------------------------
+				MISC

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#184: FILE: arch/xtensa/variants/esp32/include/variant/core.h:160:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#191: FILE: arch/xtensa/variants/esp32/include/variant/core.h:167:
+#define XCHAL_DATA_PIPE_DELAY		2	/* d-side pipeline delay
+						   (1 = 5-stage, 2 = 7-stage) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#191: FILE: arch/xtensa/variants/esp32/include/variant/core.h:167:
+						   (1 = 5-stage, 2 = 7-stage) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#203: FILE: arch/xtensa/variants/esp32/include/variant/core.h:179:
+#define XCHAL_CORE_ID			"esp32_v3_49_prod"	/* alphanum core name
+						   (CoreID) set in the Xtensa

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#204: FILE: arch/xtensa/variants/esp32/include/variant/core.h:180:
+						   Processor Generator */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#231: FILE: arch/xtensa/variants/esp32/include/variant/core.h:207:
+/*----------------------------------------------------------------------
+				CACHE

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#232: FILE: arch/xtensa/variants/esp32/include/variant/core.h:208:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#260: FILE: arch/xtensa/variants/esp32/include/variant/core.h:236:
+/****************************************************************************
+    Parameters Useful for PRIVILEGED (Supervisory or Non-Virtualized) Code

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#267: FILE: arch/xtensa/variants/esp32/include/variant/core.h:243:
+/*----------------------------------------------------------------------
+				CACHE

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#268: FILE: arch/xtensa/variants/esp32/include/variant/core.h:244:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#303: FILE: arch/xtensa/variants/esp32/include/variant/core.h:279:
+/*----------------------------------------------------------------------
+			INTERNAL I/D RAM/ROMs and XLMI

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#304: FILE: arch/xtensa/variants/esp32/include/variant/core.h:280:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#362: FILE: arch/xtensa/variants/esp32/include/variant/core.h:338:
+/*----------------------------------------------------------------------
+			INTERRUPTS and TIMERS

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#363: FILE: arch/xtensa/variants/esp32/include/variant/core.h:339:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#374: FILE: arch/xtensa/variants/esp32/include/variant/core.h:350:
+#define XCHAL_NUM_INTLEVELS		6	/* number of interrupt levels
+						   (not including level zero) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#374: FILE: arch/xtensa/variants/esp32/include/variant/core.h:350:
+						   (not including level zero) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#432: FILE: arch/xtensa/variants/esp32/include/variant/core.h:408:
+#define XCHAL_NMILEVEL			7	/* NMI "level" (for use with
+						   EXCSAVE/EPS/EPC_n, RFI n) */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#432: FILE: arch/xtensa/variants/esp32/include/variant/core.h:408:
+						   EXCSAVE/EPS/EPC_n, RFI n) */

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#435: FILE: arch/xtensa/variants/esp32/include/variant/core.h:411:
+#define XCHAL_INT0_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#436: FILE: arch/xtensa/variants/esp32/include/variant/core.h:412:
+#define XCHAL_INT1_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#437: FILE: arch/xtensa/variants/esp32/include/variant/core.h:413:
+#define XCHAL_INT2_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#438: FILE: arch/xtensa/variants/esp32/include/variant/core.h:414:
+#define XCHAL_INT3_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#439: FILE: arch/xtensa/variants/esp32/include/variant/core.h:415:
+#define XCHAL_INT4_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#440: FILE: arch/xtensa/variants/esp32/include/variant/core.h:416:
+#define XCHAL_INT5_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#441: FILE: arch/xtensa/variants/esp32/include/variant/core.h:417:
+#define XCHAL_INT6_TYPE ^IXTHAL_INTTYPE_TIMER$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#442: FILE: arch/xtensa/variants/esp32/include/variant/core.h:418:
+#define XCHAL_INT7_TYPE ^IXTHAL_INTTYPE_SOFTWARE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#443: FILE: arch/xtensa/variants/esp32/include/variant/core.h:419:
+#define XCHAL_INT8_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#444: FILE: arch/xtensa/variants/esp32/include/variant/core.h:420:
+#define XCHAL_INT9_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#445: FILE: arch/xtensa/variants/esp32/include/variant/core.h:421:
+#define XCHAL_INT10_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#446: FILE: arch/xtensa/variants/esp32/include/variant/core.h:422:
+#define XCHAL_INT11_TYPE ^IXTHAL_INTTYPE_PROFILING$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#447: FILE: arch/xtensa/variants/esp32/include/variant/core.h:423:
+#define XCHAL_INT12_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#448: FILE: arch/xtensa/variants/esp32/include/variant/core.h:424:
+#define XCHAL_INT13_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#449: FILE: arch/xtensa/variants/esp32/include/variant/core.h:425:
+#define XCHAL_INT14_TYPE ^IXTHAL_INTTYPE_NMI$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#450: FILE: arch/xtensa/variants/esp32/include/variant/core.h:426:
+#define XCHAL_INT15_TYPE ^IXTHAL_INTTYPE_TIMER$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#451: FILE: arch/xtensa/variants/esp32/include/variant/core.h:427:
+#define XCHAL_INT16_TYPE ^IXTHAL_INTTYPE_TIMER$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#452: FILE: arch/xtensa/variants/esp32/include/variant/core.h:428:
+#define XCHAL_INT17_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#453: FILE: arch/xtensa/variants/esp32/include/variant/core.h:429:
+#define XCHAL_INT18_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#454: FILE: arch/xtensa/variants/esp32/include/variant/core.h:430:
+#define XCHAL_INT19_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#455: FILE: arch/xtensa/variants/esp32/include/variant/core.h:431:
+#define XCHAL_INT20_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#456: FILE: arch/xtensa/variants/esp32/include/variant/core.h:432:
+#define XCHAL_INT21_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#457: FILE: arch/xtensa/variants/esp32/include/variant/core.h:433:
+#define XCHAL_INT22_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#458: FILE: arch/xtensa/variants/esp32/include/variant/core.h:434:
+#define XCHAL_INT23_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#459: FILE: arch/xtensa/variants/esp32/include/variant/core.h:435:
+#define XCHAL_INT24_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#460: FILE: arch/xtensa/variants/esp32/include/variant/core.h:436:
+#define XCHAL_INT25_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#461: FILE: arch/xtensa/variants/esp32/include/variant/core.h:437:
+#define XCHAL_INT26_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#462: FILE: arch/xtensa/variants/esp32/include/variant/core.h:438:
+#define XCHAL_INT27_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#463: FILE: arch/xtensa/variants/esp32/include/variant/core.h:439:
+#define XCHAL_INT28_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#464: FILE: arch/xtensa/variants/esp32/include/variant/core.h:440:
+#define XCHAL_INT29_TYPE ^IXTHAL_INTTYPE_SOFTWARE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#465: FILE: arch/xtensa/variants/esp32/include/variant/core.h:441:
+#define XCHAL_INT30_TYPE ^IXTHAL_INTTYPE_EXTERN_EDGE$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#466: FILE: arch/xtensa/variants/esp32/include/variant/core.h:442:
+#define XCHAL_INT31_TYPE ^IXTHAL_INTTYPE_EXTERN_LEVEL$

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#557: FILE: arch/xtensa/variants/esp32/include/variant/core.h:533:
+/*----------------------------------------------------------------------
+			EXCEPTIONS and VECTORS

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#558: FILE: arch/xtensa/variants/esp32/include/variant/core.h:534:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#561: FILE: arch/xtensa/variants/esp32/include/variant/core.h:537:
+#define XCHAL_XEA_VERSION		2	/* Xtensa Exception Architecture
+						   number: 1 == XEA1 (old)

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#563: FILE: arch/xtensa/variants/esp32/include/variant/core.h:539:
+							   0 == XEAX (extern) or TX */

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#627: FILE: arch/xtensa/variants/esp32/include/variant/core.h:603:
+/*----------------------------------------------------------------------
+				DEBUG MODULE

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#628: FILE: arch/xtensa/variants/esp32/include/variant/core.h:604:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#654: FILE: arch/xtensa/variants/esp32/include/variant/core.h:630:
+/*----------------------------------------------------------------------
+				MMU

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#655: FILE: arch/xtensa/variants/esp32/include/variant/core.h:631:
+  ----------------------------------------------------------------------*/

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#667: FILE: arch/xtensa/variants/esp32/include/variant/core.h:643:
+#define XCHAL_HAVE_PTP_MMU		0	/* full MMU (with page table
+						   [autorefill] and protection)

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#668: FILE: arch/xtensa/variants/esp32/include/variant/core.h:644:
+						   usable for an MMU-based OS */

ERROR:TRAILING_WHITESPACE: trailing whitespace
#686: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:1:
+/* $

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#686: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:1:
+/* 

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#693: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:8:
+/* This header file contains assembly-language definitions (assembly
+   macros, etc.) for this specific Xtensa processor's TIE extensions

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#715: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:30:
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */

ERROR:SPACING: space required after that ',' (ctx:VxV)
#736: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:51:
+#define XTHAL_SAS3(optie,ccuse,abi)	( ((optie) & XTHAL_SAS_ANYOT)  \
                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#736: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:51:
+#define XTHAL_SAS3(optie,ccuse,abi)	( ((optie) & XTHAL_SAS_ANYOT)  \
                               ^

ERROR:SPACING: space prohibited after that open parenthesis '('
#736: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:51:
+#define XTHAL_SAS3(optie,ccuse,abi)	( ((optie) & XTHAL_SAS_ANYOT)  \

ERROR:SPACING: space prohibited before that close parenthesis ')'
#738: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:53:
+					| ((abi)   & XTHAL_SAS_ANYABI) )

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#742: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:57:
+    /*
+      *  Macro to store all non-coprocessor (extra) custom TIE and optional state

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#761: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                          ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#761: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#761: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                 ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#761: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                          ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#761: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:76:
+    .macro xchal_ncp_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                                              ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#764: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:79:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#769: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:84:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#774: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:89:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#781: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:96:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#786: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:101:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#801: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:116:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#806: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:121:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#815: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:130:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#822: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:137:
+    /*
+      *  Macro to load all non-coprocessor (extra) custom TIE and optional state

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#841: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:156:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#841: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:156:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                               ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#841: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:156:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#841: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:156:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#841: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:156:
+    .macro xchal_ncp_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
                                                                                             ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#844: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:159:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#849: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:164:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_GLOB) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#854: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:169:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#861: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:176:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_CC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#866: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:181:
+	.ifeq (XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#881: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:196:
+	.elseif ((XTHAL_SAS_OPT | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#886: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:201:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#895: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:210:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:TRAILING_WHITESPACE: trailing whitespace
#904: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:219:
+    /* $

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#914: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:229:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                              ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#914: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:229:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                    ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#914: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:229:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                     ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#914: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:229:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                              ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#914: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:229:
+    .macro	xchal_cp0_store  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                                                  ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#917: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:232:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#940: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:255:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:TRAILING_WHITESPACE: trailing whitespace
#946: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:261:
+    /* $

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#956: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:271:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                             ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#956: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:271:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                   ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#956: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:271:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                    ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#956: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:271:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                             ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#956: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:271:
+    .macro	xchal_cp0_load  ptr at1 at2 at3 at4  continue=0 ofs=-1 select=XTHAL_SAS_ALL alloc=0
           	                                                                                 ^

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#959: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:274:
+	.ifeq (XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\select)

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#982: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:297:
+	.elseif ((XTHAL_SAS_TIE | XTHAL_SAS_NOCC | XTHAL_SAS_CALR) & ~(\alloc)) == 0

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#992: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:307:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#992: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:307:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#992: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:307:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#992: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:307:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#992: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:307:
+	.macro xchal_cp1_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#993: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:308:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#993: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:308:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#993: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:308:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#993: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:308:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#993: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:308:
+	.macro xchal_cp1_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#994: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:309:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#994: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:309:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#994: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:309:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#994: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:309:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#994: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:309:
+	.macro xchal_cp2_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#995: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:310:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#995: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:310:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#995: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:310:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#995: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:310:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#995: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:310:
+	.macro xchal_cp2_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#996: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:311:
+	.macro xchal_cp3_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#996: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:311:
+	.macro xchal_cp3_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#996: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:311:
+	.macro xchal_cp3_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#996: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:311:
+	.macro xchal_cp3_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#996: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:311:
+	.macro xchal_cp3_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#997: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:312:
+	.macro xchal_cp3_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#997: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:312:
+	.macro xchal_cp3_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#997: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:312:
+	.macro xchal_cp3_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#997: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:312:
+	.macro xchal_cp3_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#997: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:312:
+	.macro xchal_cp3_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#998: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:313:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#998: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:313:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#998: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:313:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#998: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:313:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#998: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:313:
+	.macro xchal_cp4_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#999: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:314:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#999: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:314:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#999: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:314:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#999: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:314:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#999: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:314:
+	.macro xchal_cp4_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1000: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:315:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1000: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:315:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1000: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:315:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1000: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:315:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1000: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:315:
+	.macro xchal_cp5_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1001: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:316:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1001: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:316:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1001: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:316:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1001: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:316:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1001: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:316:
+	.macro xchal_cp5_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1002: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:317:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1002: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:317:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1002: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:317:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1002: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:317:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1002: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:317:
+	.macro xchal_cp6_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1003: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:318:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1003: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:318:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1003: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:318:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1003: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:318:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1003: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:318:
+	.macro xchal_cp6_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1004: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:319:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1004: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:319:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1004: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:319:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1004: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:319:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1004: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:319:
+	.macro xchal_cp7_store	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                      	                                   ^

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1005: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:320:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                  ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1005: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:320:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                        ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1005: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:320:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                         ^

ERROR:SPACING: spaces required around that '=' (ctx:VxO)
#1005: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:320:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                  ^

ERROR:SPACING: space required before that '-' (ctx:OxV)
#1005: FILE: arch/xtensa/variants/esp32/include/variant/tie-asm.h:320:
+	.macro xchal_cp7_load	p a b c d continue=0 ofs=-1 select=-1 ; .endm
 	                     	                                   ^

ERROR:TRAILING_WHITESPACE: trailing whitespace
#1015: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:1:
+/* $

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#1015: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:1:
+/* 

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1022: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:8:
+/* This header file describes this specific Xtensa processor's TIE extensions
+   that extend basic Xtensa core functionality.  It is customized to this

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1044: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:30:
+   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1059: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:45:
+#define XCHAL_CP_ID_FPU             ^I0^I/* coprocessor ID (0..7) */$

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1126: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:112:
+#define XCHAL_NCP_SA_LIST(s)	\
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1127: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:113:
+ XCHAL_SA_REG(s,1,2,1,1,      threadptr, 4, 4, 4,0x03E7,  ur,231, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1128: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:114:
+ XCHAL_SA_REG(s,1,0,0,1,          acclo, 4, 4, 4,0x0210,  sr,16 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1129: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:115:
+ XCHAL_SA_REG(s,1,0,0,1,          acchi, 4, 4, 4,0x0211,  sr,17 ,  8,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1130: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:116:
+ XCHAL_SA_REG(s,0,0,0,1,             br, 4, 4, 4,0x0204,  sr,4  , 16,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1131: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:117:
+ XCHAL_SA_REG(s,0,0,0,1,      scompare1, 4, 4, 4,0x020C,  sr,12 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1132: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:118:
+ XCHAL_SA_REG(s,0,0,0,1,             m0, 4, 4, 4,0x0220,  sr,32 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1133: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:119:
+ XCHAL_SA_REG(s,0,0,0,1,             m1, 4, 4, 4,0x0221,  sr,33 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1134: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:120:
+ XCHAL_SA_REG(s,0,0,0,1,             m2, 4, 4, 4,0x0222,  sr,34 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1135: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:121:
+ XCHAL_SA_REG(s,0,0,0,1,             m3, 4, 4, 4,0x0223,  sr,35 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1136: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:122:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_lo, 4, 4, 4,0x03EA,  ur,234, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1137: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:123:
+ XCHAL_SA_REG(s,0,0,1,0,        f64r_hi, 4, 4, 4,0x03EB,  ur,235, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1138: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:124:
+ XCHAL_SA_REG(s,0,0,1,0,           f64s, 4, 4, 4,0x03EC,  ur,236, 32,0,0,0)
                                                                         ^

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1141: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:127:
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
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1142: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:128:
+ XCHAL_SA_REG(s,0,0,1,0,            fcr, 4, 4, 4,0x03E8,  ur,232, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1143: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:129:
+ XCHAL_SA_REG(s,0,0,1,0,            fsr, 4, 4, 4,0x03E9,  ur,233, 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1144: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:130:
+ XCHAL_SA_REG(s,0,0,2,0,             f0, 4, 4, 4,0x0030,   f,0  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1145: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:131:
+ XCHAL_SA_REG(s,0,0,2,0,             f1, 4, 4, 4,0x0031,   f,1  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1146: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:132:
+ XCHAL_SA_REG(s,0,0,2,0,             f2, 4, 4, 4,0x0032,   f,2  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1147: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:133:
+ XCHAL_SA_REG(s,0,0,2,0,             f3, 4, 4, 4,0x0033,   f,3  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1148: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:134:
+ XCHAL_SA_REG(s,0,0,2,0,             f4, 4, 4, 4,0x0034,   f,4  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1149: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:135:
+ XCHAL_SA_REG(s,0,0,2,0,             f5, 4, 4, 4,0x0035,   f,5  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1150: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:136:
+ XCHAL_SA_REG(s,0,0,2,0,             f6, 4, 4, 4,0x0036,   f,6  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1151: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:137:
+ XCHAL_SA_REG(s,0,0,2,0,             f7, 4, 4, 4,0x0037,   f,7  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1152: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:138:
+ XCHAL_SA_REG(s,0,0,2,0,             f8, 4, 4, 4,0x0038,   f,8  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1153: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:139:
+ XCHAL_SA_REG(s,0,0,2,0,             f9, 4, 4, 4,0x0039,   f,9  , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1154: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:140:
+ XCHAL_SA_REG(s,0,0,2,0,            f10, 4, 4, 4,0x003A,   f,10 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1155: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:141:
+ XCHAL_SA_REG(s,0,0,2,0,            f11, 4, 4, 4,0x003B,   f,11 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1156: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:142:
+ XCHAL_SA_REG(s,0,0,2,0,            f12, 4, 4, 4,0x003C,   f,12 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1157: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:143:
+ XCHAL_SA_REG(s,0,0,2,0,            f13, 4, 4, 4,0x003D,   f,13 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1158: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:144:
+ XCHAL_SA_REG(s,0,0,2,0,            f14, 4, 4, 4,0x003E,   f,14 , 32,0,0,0) \
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                             ^

ERROR:SPACING: space prohibited before that ',' (ctx:WxW)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1159: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:145:
+ XCHAL_SA_REG(s,0,0,2,0,            f15, 4, 4, 4,0x003F,   f,15 , 32,0,0,0)
                                                                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
                                 	                             ^

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1183: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:169:
+#define XCHAL_OP0_FORMAT_LENGTHS	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#1185: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:171:
+#define XCHAL_BYTE0_FORMAT_LENGTHS	\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1186: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:172:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1187: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:173:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1188: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:174:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1189: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:175:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1190: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:176:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1191: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:177:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1192: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:178:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3,\
 	                                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	               ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                   ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                     ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                       ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                         ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                              ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                  ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                      ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                        ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                            ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1193: FILE: arch/xtensa/variants/esp32/include/variant/tie.h:179:
+	3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3, 3,3,3,3,3,3,3,3,2,2,2,2,2,2,3,3
 	                                                              ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
