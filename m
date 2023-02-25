Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADA3D7B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677352604; x=1708888604;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M6Gts3O4ENH8tu3SxSqqinqquLHUAHEDDHfMBOkJvgk=;
  b=JAeTFjOJOUI/TaHFents0k6stuh/0H+MxBcuZfqIOhiNfL/Nn9P/FOv6
   bEWLCKIfA6sBRdSjPhlwSnmCkP2n7eP3ALYBsF4Ru7/C3WGt+tHg8hZgZ
   L0kD1yTZWjUY44zIMnG/cW1XBLm51eEjnJ38uyx/itLBpKHLSoLhweQqJ
   f9IGM2eodVrp/2Vq51iAchaxAWODCMynx1kxZw1OjkPrF1/u2EvqRNHoE
   aSHafNmZQZfoWNP28SlG6FtuEmKJ6eSzmn7uSt8Qn2QwI4QJ5FJXn2c86
   n3Rj2pWpydT3odFCYPJ+GeM+8e64W6aN+z23Lb/Elj/SFOP8JhFXLehLg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="313327064"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="313327064"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 11:16:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="762147107"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="762147107"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2023 11:16:42 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW02D-0003Nr-0a;
	Sat, 25 Feb 2023 19:16:41 +0000
Date: Sun, 26 Feb 2023 03:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+288 bytes kernel size regression] [i386-tinyconfig]
 [cb018fee51] x86/alternatives: Teach text_poke_bp() to patch Jcc.d32
 instructions
Message-ID: <63fa5e79.VtBHx/RpKW7eSlfq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +288 bytes kernel size regression due to commit:

commit: cb018fee513c42d4f449f31c1b6703d9c9386ae9 (x86/alternatives: Teach text_poke_bp() to patch Jcc.d32 instructions)
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git linux-6.2.y


Details as below (size data is obtained by `nm --size-sort vmlinux`):

a3ab0272: x86/alternatives: Introduce int3_emulate_jcc()
cb018fee: x86/alternatives: Teach text_poke_bp() to patch Jcc.d32 instructions

+-------------------------+----------+----------+-------+
|         symbol          | a3ab0272 | cb018fee | delta |
+-------------------------+----------+----------+-------+
| nm.T.poke_int3_handler  | 223      | 363      | 140   |
| bzImage                 | 496032   | 496160   | 128   |
| nm.t.text_poke_bp_batch | 306      | 382      | 76    |
| nm.t.text_poke_loc_init | 249      | 297      | 48    |
| nm.d.jcc_mask           | 0        | 24       | 24    |
+-------------------------+----------+----------+-------+



Thanks

