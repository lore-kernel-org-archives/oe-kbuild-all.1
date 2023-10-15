Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38EC6FA3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="soUAZF6r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=lphFVItBCZdxDfyZ+Gs+8bM3rP0WKqhaKl1S3iCm6Qw=; b=soUAZF6rPtbzLTY+03AkaHhjtS
	yasYUZbp5fTatDF0fq5OH0GIr302Ih298R8Tn/sMZUHptJlqbBKMuiuPq5DjpNSg0SyNPoP3he26l
	DllpWueerh+Kt42xQbOB87M1fZhQ1wweiGpV17UKhMZXg3/tN/NNTzjstuUQtBWfVV8YMidSiwH7O
	nBMZZ8JeTDuAp+mVD1oSeKgTRI9B8CUIPaDtQo1FMPSQFs0sdBxvJl4HmHd2WngGmx8sIP6nmSTxz
	ks7mQm+wKCrWgh4WIx6PlLlWOgPW7a2xdhZ2ACGx9rQEdyUOf7JYilhhv2MwzVcvC6NPrWl3vhhmC
	hzTsCTBQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1qs0Z2-004hfx-0n;
	Sun, 15 Oct 2023 12:49:48 +0000
Date: Sun, 15 Oct 2023 12:49:48 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: kernel test robot <lkp@intel.com>, mpe@ellerman.id.au
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [powerpc:next 11/12] checkpatch: WARNING: externs should be
 avoided in .c files
Message-ID: <ZSvf7BIGsgBSrwdC@gallifrey>
References: <202310152028.vHq3w3tc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <202310152028.vHq3w3tc-lkp@intel.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-12-amd64 (x86_64)
X-Uptime: 12:47:58 up 29 days, 15:46,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* kernel test robot (lkp@intel.com) wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> head:   c7e0d9bb9154c6e6b2ac8746faba27b53393f25e
> commit: 0ebc7feae79ac07772a20382eebd8c3503313714 [11/12] powerpc: Use shared font data
> reproduce: (https://download.01.org/0day-ci/archive/20231015/202310152028.vHq3w3tc-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310152028.vHq3w3tc-lkp@intel.com/

Hmm, I don't think my patch has changed any of the lines in btext.c
that it's moaning about.

Dave

> # many are suggestions rather than must-fix
> 
> WARNING:AVOID_EXTERNS: externs should be avoided in .c files
> #1029: FILE: arch/powerpc/kernel/btext.c:47:
> +extern void rmci_on(void);
> 
> WARNING:AVOID_EXTERNS: externs should be avoided in .c files
> #1030: FILE: arch/powerpc/kernel/btext.c:48:
> +extern void rmci_off(void);
> 
> ERROR:SPACING: space prohibited after that '*' (ctx:WxW)
> #1133: FILE: arch/powerpc/kernel/btext.c:151:
> +	size = dispDeviceRowBytes * dispDeviceRect[3] + offset
>  	                          ^
> 
> ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
> #1231: FILE: arch/powerpc/kernel/btext.c:249:
> +static unsigned char * calc_base(int x, int y)
> 
> WARNING:SPACE_BEFORE_TAB: please, no space before tabs
> #1276: FILE: arch/powerpc/kernel/btext.c:294:
> +^Iunsigned long width ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$
> 
> ERROR:SPACING: space required after that ',' (ctx:VxV)
> #1278: FILE: arch/powerpc/kernel/btext.c:296:
> +	int i,j;
>  	     ^
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1281: FILE: arch/powerpc/kernel/btext.c:299:
> +	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1]); i++)
> +	{
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1281: FILE: arch/powerpc/kernel/btext.c:299:
> +	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1]); i++)
>  	      ^
> 
> ERROR:SPACING: spaces required around that '<' (ctx:VxV)
> #1281: FILE: arch/powerpc/kernel/btext.c:299:
> +	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1]); i++)
>  	           ^
> 
> WARNING:LINE_SPACING: Missing a blank line after declarations
> #1284: FILE: arch/powerpc/kernel/btext.c:302:
> +		unsigned int *ptr = base;
> +		for(j=width; j; --j)
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1284: FILE: arch/powerpc/kernel/btext.c:302:
> +		for(j=width; j; --j)
>  		     ^
> 
> ERROR:SPACING: space required before the open parenthesis '('
> #1284: FILE: arch/powerpc/kernel/btext.c:302:
> +		for(j=width; j; --j)
> 
> WARNING:SPACE_BEFORE_TAB: please, no space before tabs
> #1294: FILE: arch/powerpc/kernel/btext.c:312:
> +^Iunsigned long width ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$
> 
> ERROR:SPACING: space required after that ',' (ctx:VxV)
> #1296: FILE: arch/powerpc/kernel/btext.c:314:
> +	int i,j;
>  	     ^
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1298: FILE: arch/powerpc/kernel/btext.c:316:
> +	for (i=0; i < (dispDeviceRect[3] - dispDeviceRect[1]); i++)
> +	{
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1298: FILE: arch/powerpc/kernel/btext.c:316:
> +	for (i=0; i < (dispDeviceRect[3] - dispDeviceRect[1]); i++)
>  	      ^
> 
> WARNING:LINE_SPACING: Missing a blank line after declarations
> #1301: FILE: arch/powerpc/kernel/btext.c:319:
> +		unsigned int *ptr = base;
> +		for(j = width; j > 0; j -= 8) {
> 
> ERROR:SPACING: space required before the open parenthesis '('
> #1301: FILE: arch/powerpc/kernel/btext.c:319:
> +		for(j = width; j > 0; j -= 8) {
> 
> WARNING:SPACE_BEFORE_TAB: please, no space before tabs
> #1313: FILE: arch/powerpc/kernel/btext.c:331:
> +^Iunsigned long width ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$
> 
> ERROR:SPACING: space required after that ',' (ctx:VxV)
> #1315: FILE: arch/powerpc/kernel/btext.c:333:
> +	int i,j;
>  	     ^
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1317: FILE: arch/powerpc/kernel/btext.c:335:
> +	for (i=0; i < 16; i++)
> +	{
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1317: FILE: arch/powerpc/kernel/btext.c:335:
> +	for (i=0; i < 16; i++)
>  	      ^
> 
> WARNING:LINE_SPACING: Missing a blank line after declarations
> #1320: FILE: arch/powerpc/kernel/btext.c:338:
> +		unsigned int *ptr = base;
> +		for(j = width; j > 0; j -= 8) {
> 
> ERROR:SPACING: space required before the open parenthesis '('
> #1320: FILE: arch/powerpc/kernel/btext.c:338:
> +		for(j = width; j > 0; j -= 8) {
> 
> WARNING:SPACE_BEFORE_TAB: please, no space before tabs
> #1333: FILE: arch/powerpc/kernel/btext.c:351:
> +^Iunsigned int *src     ^I= (unsigned int *)calc_base(0,16);$
> 
> ERROR:SPACING: space required after that ',' (ctx:VxV)
> #1333: FILE: arch/powerpc/kernel/btext.c:351:
> +	unsigned int *src     	= (unsigned int *)calc_base(0,16);
>  	                      	                             ^
> 
> WARNING:SPACE_BEFORE_TAB: please, no space before tabs
> #1334: FILE: arch/powerpc/kernel/btext.c:352:
> +^Iunsigned int *dst     ^I= (unsigned int *)calc_base(0,0);$
> 
> ERROR:SPACING: space required after that ',' (ctx:VxV)
> #1334: FILE: arch/powerpc/kernel/btext.c:352:
> +	unsigned int *dst     	= (unsigned int *)calc_base(0,0);
>  	                      	                             ^
> 
> WARNING:SPACE_BEFORE_TAB: please, no space before tabs
> #1335: FILE: arch/powerpc/kernel/btext.c:353:
> +^Iunsigned long width    ^I= ((dispDeviceRect[2] - dispDeviceRect[0]) *$
> 
> ERROR:SPACING: space required after that ',' (ctx:VxV)
> #1337: FILE: arch/powerpc/kernel/btext.c:355:
> +	int i,j;
>  	     ^
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1341: FILE: arch/powerpc/kernel/btext.c:359:
> +	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1] - 16); i++)
> +	{
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1341: FILE: arch/powerpc/kernel/btext.c:359:
> +	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1] - 16); i++)
>  	      ^
> 
> ERROR:SPACING: spaces required around that '<' (ctx:VxV)
> #1341: FILE: arch/powerpc/kernel/btext.c:359:
> +	for (i=0; i<(dispDeviceRect[3] - dispDeviceRect[1] - 16); i++)
>  	           ^
> 
> WARNING:LINE_SPACING: Missing a blank line after declarations
> #1345: FILE: arch/powerpc/kernel/btext.c:363:
> +		unsigned int *dst_ptr = dst;
> +		for(j=width; j; --j)
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1345: FILE: arch/powerpc/kernel/btext.c:363:
> +		for(j=width; j; --j)
>  		     ^
> 
> ERROR:SPACING: space required before the open parenthesis '('
> #1345: FILE: arch/powerpc/kernel/btext.c:363:
> +		for(j=width; j; --j)
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1350: FILE: arch/powerpc/kernel/btext.c:368:
> +	for (i=0; i<16; i++)
> +	{
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1350: FILE: arch/powerpc/kernel/btext.c:368:
> +	for (i=0; i<16; i++)
>  	      ^
> 
> ERROR:SPACING: spaces required around that '<' (ctx:VxV)
> #1350: FILE: arch/powerpc/kernel/btext.c:368:
> +	for (i=0; i<16; i++)
>  	           ^
> 
> WARNING:LINE_SPACING: Missing a blank line after declarations
> #1353: FILE: arch/powerpc/kernel/btext.c:371:
> +		unsigned int *dst_ptr = dst;
> +		for(j=width; j; --j)
> 
> ERROR:SPACING: spaces required around that '=' (ctx:VxV)
> #1353: FILE: arch/powerpc/kernel/btext.c:371:
> +		for(j=width; j; --j)
>  		     ^
> 
> ERROR:SPACING: space required before the open parenthesis '('
> #1353: FILE: arch/powerpc/kernel/btext.c:371:
> +		for(j=width; j; --j)
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1395: FILE: arch/powerpc/kernel/btext.c:413:
> +	for (l = 0; l < 16; ++l)
> +	{
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1417: FILE: arch/powerpc/kernel/btext.c:435:
> +	for (l = 0; l < 16; ++l)
> +	{
> 
> ERROR:OPEN_BRACE: that open brace { should be on the previous line
> #1435: FILE: arch/powerpc/kernel/btext.c:453:
> +	for (l = 0; l < 16; ++l)
> +	{
> 
> ERROR:SPACING: space required before the open parenthesis '('
> #1452: FILE: arch/powerpc/kernel/btext.c:470:
> +	switch(dispDeviceDepth) {
> 
> ERROR:SPACING: space prohibited after that '&' (ctx:WxW)
> #1483: FILE: arch/powerpc/kernel/btext.c:501:
> +		g_loc_X = (g_loc_X & -8) + 8;
>  		                   ^
> 
> WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
> #1508: FILE: arch/powerpc/kernel/btext.c:526:
> +	/* wrap around from bottom to top of screen so we don't
> +	   waste time scrolling each line.  -- paulus. */
> 
> WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
> #1508: FILE: arch/powerpc/kernel/btext.c:526:
> +	   waste time scrolling each line.  -- paulus. */
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
