Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E282019B5A3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 07:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770447757; cv=none; b=bZpNL5HsSnaijDmdGOHqGt3yRgPbKvvm8SPvEUTQlyS13EbNmVgPgNNT0YGcXIpyenq4X8bYYrjeUpaJgdNmlBzvShppeFnW0QIHl0e1ONOwn9xT0wlufpDZLew0ILmlPUN07qPjyPprGdSLE4mviS20oJFJbYD+mb1TMTun1LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770447757; c=relaxed/simple;
	bh=TdBN9tS1hQkLON8HxQd0uL/qshuKZSVhTpW7pDA7dgQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AV58HzR1t13oP1ot0Ke9C9joWARzKrqDPqW7KDrpkxfJ9o2ISo+XhFS2xNO8xn3YiyHcw6s+foQuAYoOCs1zy34Tmp7BKun0x7QPn3sQyWO9PuqIlmBMBMkhINcfCCKUAm5Ql2YyqfFZgW/UH8HQJz5frQ5ETuSXS+YiNJbRtgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIUKdVB7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIUKdVB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770447757; x=1801983757;
  h=date:from:to:cc:subject:message-id;
  bh=TdBN9tS1hQkLON8HxQd0uL/qshuKZSVhTpW7pDA7dgQ=;
  b=lIUKdVB7DpNsJd7ky4jiPjoSt6EVWMKgavZXG54WIMbUiBelnzsgdHuU
   poltSo/xMGwu9JQQSnZ3Gk20QT3bGqyb0BOOueAQ9UqNRIcYCR6Yqv29f
   QTQZhJX0VR3Evg23z9VEvbRTmmelesCtHjS7ujgGih9BwTjL/e5xV834C
   tpyZP/UjpfKbnIccoUKc9wKWujwiO09yR4gbiPE53av7LGXvWTqOVeatO
   ScQDAR+bTD2g9spl1LZdifJeixwQoSpMel9Y9pQKH8w0IwkuI4QagoIeJ
   TsxQxuXyemPdBX9C+w7nLFlw3Monx5tUJqIxJ2x9hRqA1UElEDCNHVGvn
   A==;
X-CSE-ConnectionGUID: DisKvw5hT6O40BNmRhR7/w==
X-CSE-MsgGUID: Ro4E/ku3Qp6FCKoX03jz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71539453"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71539453"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 23:02:36 -0800
X-CSE-ConnectionGUID: p6xspT1eQRexzPXKQhAdrw==
X-CSE-MsgGUID: +YuxAfKLRj2HoPwuodzAzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210870757"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2026 23:02:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vocKu-00000000lTG-1Ziv;
	Sat, 07 Feb 2026 07:02:32 +0000
Date: Sat, 07 Feb 2026 15:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202602071508.ExABxCqK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   057ef31ac12837dabdac1d890cecba0b55ff87c0
commit: 33b86e5f432843895a6f0fbb66961bd963a3b8bb [0/2] ANDROID: usb: gadget: Add Android Accessory Function
config: i386-randconfig-062-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071508.ExABxCqK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071508.ExABxCqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071508.ExABxCqK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:786:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:798:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:840:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:1392:6: sparse: sparse: symbol '__acc_req_match' was not declared. Should it be static?

vim +353 drivers/usb/gadget/function/android_f_accessory.c

   344	
   345	/* remove a request from the head of a list */
   346	static struct usb_request *req_get(struct acc_dev *dev, struct list_head *head)
   347	{
   348		unsigned long flags;
   349		struct usb_request *req;
   350	
   351		spin_lock_irqsave(&dev->lock, flags);
   352		if (list_empty(head)) {
 > 353			req = 0;
   354		} else {
   355			req = list_first_entry(head, struct usb_request, list);
   356			list_del(&req->list);
   357		}
   358		spin_unlock_irqrestore(&dev->lock, flags);
   359		return req;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
