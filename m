Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500037;
	b=sBq0dxNnM+1hsIZcFStlGqpMcYwvUWz8FH2sQ6VxOXyg92AchYgHEMwJCPTB3fU/Ivlw
	 Antuhpe0bjNEhiHdJaifUqQD6vWik8+jektto/4klj+0XYVgKCNXlZ06ZqQKycqXqaZK9
	 fIibivflSch2zFYOqDawwosrAMuwKClTaIIIkiCpTSs9rKIn/mSZo2+7vswDaV1/eqmZm
	 7z+7aag+//ydn+TViZ8rHdOsRjyeYG4mdEPR5ZDjsfagSebe0ESyvimHs8lgPLPDpivOq
	 naAXtwQyaDlhAZUN12tDDmad6ABw88Bs821vPMcQmd19RpHvWCAexYWKoQ5FtGl3GXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500037;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ni4W0UP20+C+3naAyutWVX3d15t1HyAI47zCuc5pX44=;
	b=rb1wc/NCKmEdVbcbEUx2XqRMqPyGaxzmNaVX5b2tk8zGwfzXJvZPv/vWnwtC2goY83WV
	 sdO/igS/4ne+eNI1d7zolfxqiGjRCRqF1+xoy19/eYUujRJQPNSWURJIfpLeYly4sBXqB
	 62qhclDcObvelvAXicbJ5RXddmKzpVgvo0hRjMfBD6bV6GDJSc3utWShE4Qmwr7KTWk3I
	 cFmu90MENC5Xum8ZmgSPRmt630OY71EGqo1mn9qxLxWLoVUBxTovh/+S73zDETOcF0PnN
	 uIfLaNyuyPLs1HS1rIA5L87NqKRyDqLs5SkH9LWBiRNCcY7q/XAomdhnKlEa4jJrbgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyaTTh8h;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A7606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 16:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C65A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EyaTTh8h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794500037; x=1826036037;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XvbqEH5gZLIHcDzZRDRxOKkhN6vKwHa+cReWDlUzqBI=;
  b=EyaTTh8hTimGBWZ8K4fl8jr+KX7Ta6rqGC89DfEg0m9BrGtc5VC99LCu
   2thKYuYIjPN/dIH82aW8LtzNTjLfQqHOT+Pjitmx2Jwm+Tv/4uFiZC3kH
   goZisVShHNow/FazJvus9wvpmRQyAkAMpQcVHZnJKrqSKzi3vKdl+LX6r
   6kNTejHdkdU2A70d/cU2JYKFe4xOo0wbyu00rHCT2Vr6FoGthvD1tCdNj
   hH46JIeWvLPG9NQfdK/nyzs4LLRFIbS0mps2hiRU0UTMHcYtqju6lsc0P
   C4HEoUl5W200wIyTbRxTjy/Ps11jLDN3FGX7i6neI+wRsfglamfxSTdej
   g==;
X-CSE-ConnectionGUID: JWPwnH+IRaCZEJMW8Z9nVA==
X-CSE-MsgGUID: gYng9LbSQvuyVd5u0J9iQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3210536"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3210536"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:13:57 -0800
X-CSE-ConnectionGUID: JL42NsINSVS4uXLRRrUrew==
X-CSE-MsgGUID: Mgh5f4e9QCOAlMWCMnGDzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8557005"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 12 Nov 2026 08:13:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRXQt-000000000ut-49fZ;
	Thu, 12 Nov 2026 16:13:51 +0000
Date: Thu, 12 Nov 2026 17:13:11 +0100
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:highmem-7.4 5/6]
 arch/powerpc/mm/init_32.c:49:2: error: #error "You must adjust
 CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"
Message-ID: <202611121726.xboRqpix-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 highmem-7.4
head:   df4e49b4b5aba7b756a58be9b221e8b431540dca
commit: e3546fc56cb085d7ddcab90dd243f250ad7830af [5/6] arch/*: increase low=
mem size to avoid highmem use
config: powerpc-randconfig-2000-20261112 (https://download.01.org/0day-ci/a=
rchive/20261112/202611121726.xboRqpix-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261112/202611121726.xboRqpix-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121726.xboRqpix-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/init_32.c:49:2: error: #error "You must adjust CONFIG_LO=
WMEM_SIZE or CONFIG_KERNEL_START"
    #error "You must adjust CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"
     ^~~~~


vim +49 arch/powerpc/mm/init_32.c

14cf11af6cf608 arch/powerpc/mm/init.c    Paul Mackerras   2005-09-26  45 =
=20
14cf11af6cf608 arch/powerpc/mm/init.c    Paul Mackerras   2005-09-26  46  #=
if defined(CONFIG_KERNEL_START_BOOL) || defined(CONFIG_LOWMEM_SIZE_BOOL)
9ddc5b6f18fbac arch/powerpc/mm/init_32.c Uwe Kleine-K=C3=B6nig 2010-01-20  =
47  /* The amount of lowmem must be within 0xF0000000 - KERNELBASE. */
ccdcef72c249c2 arch/powerpc/mm/init_32.c Dale Farnsworth  2008-12-17  48  #=
if (CONFIG_LOWMEM_SIZE > (0xF0000000 - PAGE_OFFSET))
b615f4b3f962ff arch/powerpc/mm/init_32.c Paul Bolle       2013-05-29 @49  #=
error "You must adjust CONFIG_LOWMEM_SIZE or CONFIG_KERNEL_START"
14cf11af6cf608 arch/powerpc/mm/init.c    Paul Mackerras   2005-09-26  50  #=
endif
14cf11af6cf608 arch/powerpc/mm/init.c    Paul Mackerras   2005-09-26  51  #=
endif
14cf11af6cf608 arch/powerpc/mm/init.c    Paul Mackerras   2005-09-26  52  #=
define MAX_LOW_MEM	CONFIG_LOWMEM_SIZE
14cf11af6cf608 arch/powerpc/mm/init.c    Paul Mackerras   2005-09-26  53 =
=20

:::::: The code at line 49 was first introduced by commit
:::::: b615f4b3f962ffedb8d4a7122ca049abdb420547 ppc: init_32: Fix error typ=
o "CONFIG_START_KERNEL"

:::::: TO: Paul Bolle <pebolle@tiscali.nl>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
