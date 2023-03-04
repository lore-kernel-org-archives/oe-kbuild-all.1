Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCB1FD1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677920999; x=1709456999;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LBZhx7Ejp/ZIQG7SUAtjZC0QEG3F+co/zBEq/xAImSg=;
  b=ihO1kxYx6Plpu7PwknwIEf/1IbbAFZtDCX7wreYifSkK/H87XlKm9z00
   7MCF8wHu7AHU/GgHq75LMSjlw3z+f4Rcg7puhbld8pVLpM3HAlwpUJ3nl
   6SiIN+663YojhuMVTYESOUVBPE0JsEHfvOgW8RmHQEFsTSEXJZDpKYESE
   GJTRNeC72YQpWQG2mgOG7omfT36LxeGOircyhWJwmCQIsE8T9LINWLz8g
   e+4KzzNX3Bd9NUBehikS+rphtlaa3BKyX+GXRQjGfZsYk5lzB66VpVwzX
   KBMRKJULcfcYH7fBSbBZL/w49d54U1ARnemNJJ9f9KTEVPHqXLPpl8/Xh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="323548628"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="323548628"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 01:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="744500861"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="744500861"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2023 01:09:48 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYNtj-00022O-2F;
	Sat, 04 Mar 2023 09:09:47 +0000
Date: Sat, 04 Mar 2023 17:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+171 bytes kernel size regression] [i386-tinyconfig]
 [024f219225] lib/bitmap: drop optimization of bitmap_{from,to}_arr64
Message-ID: <64030adb.3Sp6YWMOSeMYFxkz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +171 bytes kernel size regression due to commit:

commit: 024f21922587eaed6809dd6654aa41c5a419a2b3 (lib/bitmap: drop optimization of bitmap_{from,to}_arr64)
https://github.com/norov/linux topol


Details as below (size data is obtained by `nm --size-sort vmlinux`):

54fdaeda: lib/test_bitmap: increment failure counter properly
024f2192: lib/bitmap: drop optimization of bitmap_{from,to}_arr64

+------------------------------+----------+----------+-------+
|            symbol            | 54fdaeda | 024f2192 | delta |
+------------------------------+----------+----------+-------+
| nm.T.bitmap_to_arr64         | 0        | 95       | 95    |
| bzImage                      | 501536   | 501600   | 64    |
| nm.T.bitmap_from_arr64       | 0        | 59       | 59    |
| nm.t.perf_output_sample_regs | 91       | 108      | 17    |
+------------------------------+----------+----------+-------+



Thanks

