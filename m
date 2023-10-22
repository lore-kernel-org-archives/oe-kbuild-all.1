Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2254EEBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl7trjFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697946822; x=1729482822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RPhbzAwRgrPc/3HzjAp6F2ibLeGf4IleK22XAbfJG6k=;
  b=Hl7trjFY1blfZhFS+Y5uz9IaGzQKomOl0R/DJgGJbdYh0h+nVD/rBk85
   qqSVi8nPii9bg4CX+H1yYij6zK9cQb1Pn5bgOm6qXIVF8bylwnhB544lE
   fy45OPT3xKMh4gOWC1gnV8eeGTFSeF7xVemUhpoflVoqHs/CRP9wPNvw5
   ivAQs9veYHQiw7SsCUkmn5AQ7+QGLbONOfFadTGDuqIx5t/dpk2SqS3T8
   j5DVLb1cKmPfWe1S615yH8XTNHYHtL1WJAuVg7KgGRbDYC5U8+Mmt6xEW
   SLKspeI0gTqMnbQEkHJuD6P4EC6zUPUPpY0EBSMLoA9cq3bgBnttopbgZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="377054461"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="377054461"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 20:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757827478"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757827478"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 20:53:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quPX0-0005YE-0T;
	Sun, 22 Oct 2023 03:53:38 +0000
Date: Sun, 22 Oct 2023 11:53:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:next 11/13] checkpatch: WARNING: externs should be avoided
 in .c files
Message-ID: <202310221142.7Oq1eCuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux next
head:   1c7b4bc375c2a235e3dcb53c46111883df838e42
commit: 0ebc7feae79ac07772a20382eebd8c3503313714 [11/13] powerpc: Use shared font data
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310221142.7Oq1eCuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310221142.7Oq1eCuB-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#1029: FILE: arch/powerpc/kernel/btext.c:47:
+extern void rmci_on(void);

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#1030: FILE: arch/powerpc/kernel/btext.c:48:
+extern void rmci_off(void);

ERROR:SPACING: space prohibited after that '*' (ctx:WxW)
#1133: FILE: arch/powerpc/kernel/btext.c:151:
+	size = dispDeviceRowBytes * dispDeviceRect[3] + offset
 	                          ^

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#1231: FILE: arch/powerpc/kernel/btext.c:249:
+static unsigned char * calc_base(int x, int y)

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1276: FILE: arch/powerpc/kernel/btext.c:294:
+^Iunsigned long width ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1278: FILE: arch/powerpc/kernel/btext.c:296:
+	int i,j;
 	     ^

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1281: FILE: arch/powerpc/kernel/btext.c:299:
+	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1]); i++)
+	{

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1281: FILE: arch/powerpc/kernel/btext.c:299:
+	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1]); i++)
 	      ^

ERROR:SPACING: spaces required around that '<' (ctx:VxV)
#1281: FILE: arch/powerpc/kernel/btext.c:299:
+	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1]); i++)
 	           ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#1284: FILE: arch/powerpc/kernel/btext.c:302:
+		unsigned int *ptr = base;
+		for(j=width; j; --j)

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1284: FILE: arch/powerpc/kernel/btext.c:302:
+		for(j=width; j; --j)
 		     ^

ERROR:SPACING: space required before the open parenthesis '('
#1284: FILE: arch/powerpc/kernel/btext.c:302:
+		for(j=width; j; --j)

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1294: FILE: arch/powerpc/kernel/btext.c:312:
+^Iunsigned long width ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1296: FILE: arch/powerpc/kernel/btext.c:314:
+	int i,j;
 	     ^

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1298: FILE: arch/powerpc/kernel/btext.c:316:
+	for (i=0; i < (dispDeviceRect[3] - dispDeviceRect[1]); i++)
+	{

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1298: FILE: arch/powerpc/kernel/btext.c:316:
+	for (i=0; i < (dispDeviceRect[3] - dispDeviceRect[1]); i++)
 	      ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#1301: FILE: arch/powerpc/kernel/btext.c:319:
+		unsigned int *ptr = base;
+		for(j = width; j > 0; j -= 8) {

ERROR:SPACING: space required before the open parenthesis '('
#1301: FILE: arch/powerpc/kernel/btext.c:319:
+		for(j = width; j > 0; j -= 8) {

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1313: FILE: arch/powerpc/kernel/btext.c:331:
+^Iunsigned long width ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1315: FILE: arch/powerpc/kernel/btext.c:333:
+	int i,j;
 	     ^

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1317: FILE: arch/powerpc/kernel/btext.c:335:
+	for (i=0; i < 16; i++)
+	{

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1317: FILE: arch/powerpc/kernel/btext.c:335:
+	for (i=0; i < 16; i++)
 	      ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#1320: FILE: arch/powerpc/kernel/btext.c:338:
+		unsigned int *ptr = base;
+		for(j = width; j > 0; j -= 8) {

ERROR:SPACING: space required before the open parenthesis '('
#1320: FILE: arch/powerpc/kernel/btext.c:338:
+		for(j = width; j > 0; j -= 8) {

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1333: FILE: arch/powerpc/kernel/btext.c:351:
+^Iunsigned int *src     ^I= (unsigned int *)calc_base(0,16);$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1333: FILE: arch/powerpc/kernel/btext.c:351:
+	unsigned int *src     	= (unsigned int *)calc_base(0,16);
 	                      	                             ^

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1334: FILE: arch/powerpc/kernel/btext.c:352:
+^Iunsigned int *dst     ^I= (unsigned int *)calc_base(0,0);$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1334: FILE: arch/powerpc/kernel/btext.c:352:
+	unsigned int *dst     	= (unsigned int *)calc_base(0,0);
 	                      	                             ^

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#1335: FILE: arch/powerpc/kernel/btext.c:353:
+^Iunsigned long width    ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$

ERROR:SPACING: space required after that ',' (ctx:VxV)
#1337: FILE: arch/powerpc/kernel/btext.c:355:
+	int i,j;
 	     ^

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1341: FILE: arch/powerpc/kernel/btext.c:359:
+	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1] - 16); i++)
+	{

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1341: FILE: arch/powerpc/kernel/btext.c:359:
+	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1] - 16); i++)
 	      ^

ERROR:SPACING: spaces required around that '<' (ctx:VxV)
#1341: FILE: arch/powerpc/kernel/btext.c:359:
+	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1] - 16); i++)
 	           ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#1345: FILE: arch/powerpc/kernel/btext.c:363:
+		unsigned int *dst_ptr = dst;
+		for(j=width; j; --j)

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1345: FILE: arch/powerpc/kernel/btext.c:363:
+		for(j=width; j; --j)
 		     ^

ERROR:SPACING: space required before the open parenthesis '('
#1345: FILE: arch/powerpc/kernel/btext.c:363:
+		for(j=width; j; --j)

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1350: FILE: arch/powerpc/kernel/btext.c:368:
+	for (i=0; i<16; i++)
+	{

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1350: FILE: arch/powerpc/kernel/btext.c:368:
+	for (i=0; i<16; i++)
 	      ^

ERROR:SPACING: spaces required around that '<' (ctx:VxV)
#1350: FILE: arch/powerpc/kernel/btext.c:368:
+	for (i=0; i<16; i++)
 	           ^

WARNING:LINE_SPACING: Missing a blank line after declarations
#1353: FILE: arch/powerpc/kernel/btext.c:371:
+		unsigned int *dst_ptr = dst;
+		for(j=width; j; --j)

ERROR:SPACING: spaces required around that '=' (ctx:VxV)
#1353: FILE: arch/powerpc/kernel/btext.c:371:
+		for(j=width; j; --j)
 		     ^

ERROR:SPACING: space required before the open parenthesis '('
#1353: FILE: arch/powerpc/kernel/btext.c:371:
+		for(j=width; j; --j)

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1395: FILE: arch/powerpc/kernel/btext.c:413:
+	for (l = 0; l < 16; ++l)
+	{

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1417: FILE: arch/powerpc/kernel/btext.c:435:
+	for (l = 0; l < 16; ++l)
+	{

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#1435: FILE: arch/powerpc/kernel/btext.c:453:
+	for (l = 0; l < 16; ++l)
+	{

ERROR:SPACING: space required before the open parenthesis '('
#1452: FILE: arch/powerpc/kernel/btext.c:470:
+	switch(dispDeviceDepth) {

ERROR:SPACING: space prohibited after that '&' (ctx:WxW)
#1483: FILE: arch/powerpc/kernel/btext.c:501:
+		g_loc_X = (g_loc_X & -8) + 8;
 		                   ^

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#1508: FILE: arch/powerpc/kernel/btext.c:526:
+	/* wrap around from bottom to top of screen so we don't
+	   waste time scrolling each line.  -- paulus. */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#1508: FILE: arch/powerpc/kernel/btext.c:526:
+	   waste time scrolling each line.  -- paulus. */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
