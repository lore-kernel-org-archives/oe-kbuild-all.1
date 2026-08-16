Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A23D4130
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876846; cv=none; b=EuoINiT+s9DkmbdeUi4zz8jsPao9hLU+UQpsNtgo6fYT9pPa1jfcDEucPsijLUK4fDYVJ8jE5pv2/LSukVHJiziiqnwnRpLHxr9ucFfXoe2yzo3quF6xZLi69bt5SIkQhbraCvF/eXlvNdPhKmX4V8McTZNAAQhpglNTDGfL0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876846; c=relaxed/simple;
	bh=uWXtTy4VYWi4NEaZipKAsRnbpw2+rXqsvUJaPWkIoVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/lxXDUa0UwQY1/Vj2EZGNrSl9Ni/zPL2woQ4v75856zz/Q2oDmZcJJ0iDs05Y9eqvmmOKYo5jxqd50DCRi2Hll4W4MLKtrH8LDfBj+k24LgPBQXSnEqGZCAWovlWbf6qmZVeGJWcwaphg0CK2sjYSdSNg/p3GvH1pHusHDtMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mF++pn6/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF++pn6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786876844; x=1818412844;
  h=date:from:to:cc:subject:message-id;
  bh=uWXtTy4VYWi4NEaZipKAsRnbpw2+rXqsvUJaPWkIoVs=;
  b=mF++pn6/P+K5KgcMOSXgQKUjt/FJvUUXIgjFjI9Nvq8gVYnRk3WJSsgF
   QJLwceeF8lquEepFJc9EAHmt8ZgkvNcwWFCq4E3xD2sg46brRm9i02Imw
   uiUHKYSqrufsj4EUftKxPoePLXfFuMr79xsarSpuGEhkqrbuKjuzhyL72
   JSGuTDQqK1pN9bhOIyNWHGRR0ihUrmijyd5wDBqJ7QbbzrUttC5vQP00N
   9ANQf0476BcCKUK04jjb3Ri8y7l1eLct7IQYcq2EYCul4PLUJkQjeKo1D
   fQP1ArbX9FJfub5MIWnzKDwgTFS27PJwwnbAvUn+flU2PZHCOPnhzSPG5
   Q==;
X-CSE-ConnectionGUID: fnILfL4XSZ6gJuYhvM0sZA==
X-CSE-MsgGUID: QgByb0ohSYOP4UV2YZI7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="86339534"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="86339534"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 03:40:43 -0700
X-CSE-ConnectionGUID: XpLDj6/DQmm1gKELoAe4LQ==
X-CSE-MsgGUID: E55vFcnmQimrUF859Z5mdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268496492"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Aug 2026 03:40:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvYIB-00000000cra-2oKQ;
	Sun, 16 Aug 2026 10:40:39 +0000
Date: Sun, 16 Aug 2026 18:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for
 'rb_event_size'
Message-ID: <202608161839.5EVXqib7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: 794f874404060e7e14863872950b53e6a7aa9b68 [2/2] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260816/202608161839.5EVXqib7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161839.5EVXqib7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161839.5EVXqib7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
   arch/arm64/kvm/hyp/nvhe/trace.c:134:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     134 |  struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                 ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c: At top level:
>> arch/arm64/kvm/hyp/nvhe/trace.c:174:15: warning: no previous prototype for 'rb_event_size' [-Wmissing-prototypes]
     174 | unsigned long rb_event_size(unsigned long length)
         |               ^~~~~~~~~~~~~


vim +/rb_event_size +174 arch/arm64/kvm/hyp/nvhe/trace.c

   173	
 > 174	unsigned long rb_event_size(unsigned long length)
   175	{
   176		struct ring_buffer_event *event;
   177	
   178		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   179	}
   180	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
