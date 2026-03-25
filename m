Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7EA30BB8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420436; cv=none; b=cMVV3HtieXJeoKQ4SjBzjF28STl7F6ohz+H+YBMPiLaPJA/Nxm+KwXC8eNcsh9SL7j+JcsES7vgSdtT36SFcSXqSxFkxO5eSvKSDcRuHz5pba+mSDtEgm2Rl5JbfSU4WNaVjWKh6XyhqmawZ8q9Rq8+trsegouFjQ5iKLoOw9S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420436; c=relaxed/simple;
	bh=i0PNVwur+ozvQrmCjFg+6v4y/vttvi3U7h07R95aNAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FDiNGNsni5HKYElcWvzmYoK2yr/c6vnL0VxaMxkiBGBjSETthspdQ53nJtBHFSzLC2b9zINFlnJE1HRHd2IrvFwNM3oXS/acITLZ4psh7/Huaww9XnyhPdSsWueteCheZe1z4PJDPVtUCUiiAmbbSn+Lwt0mnSwg4yyT/qwd1rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhvKjhGA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhvKjhGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774420435; x=1805956435;
  h=date:from:to:cc:subject:message-id;
  bh=i0PNVwur+ozvQrmCjFg+6v4y/vttvi3U7h07R95aNAo=;
  b=lhvKjhGASIuJxzLL/rnMk91F0nnbjvvfW9SrqRZ38z6+l3fvpwGwDdBK
   h0YnZcbczoN8VlI98CT5LfRJtcyA6cOaYQyh15IZqnztpZmaRpNy8kkEi
   ckGyDnu4T/sHAhXLfyk/v7dq1S2lRpZ9OL4i/OXsgFZDxItv0kROgWBKj
   GO2PqB46A44ZUpYkpN+qZmN1zhfxIzUEpqToO6a3p9yQGPYDc2YzPMpHr
   QfYLV9YYnjE5ICVV8IJVzpN2BwZL83EfEoKmKrqzNDaJ+kS0duzgIdudj
   uBJAKwCZS9o6HuJymVuRmFvJ7ZbfzTKNFe5htbo4nP3GSIkDPNgI3D1KC
   g==;
X-CSE-ConnectionGUID: S3VBr+JhSne/1tqJ3wCe6w==
X-CSE-MsgGUID: uYsbXnQaQ8GnyqJ6HI5OVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86144699"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86144699"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:33:55 -0700
X-CSE-ConnectionGUID: Nt1xq3A8QRWaHymuc3wV3Q==
X-CSE-MsgGUID: UC9uKceUR2uQlW2uEY56nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229506320"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 23:33:53 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5HoM-000000006JN-1E9N;
	Wed, 25 Mar 2026 06:33:50 +0000
Date: Wed, 25 Mar 2026 14:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for '__acc_req_match'
Message-ID: <202603251439.Kx5md75s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 8851a623b7a1a9456fc1e66855ad369c3f7f6483 [1/1] ANDROID: usb: gadget: Add Android Accessory Function
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260325/202603251439.Kx5md75s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251439.Kx5md75s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251439.Kx5md75s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no previous prototype for '__acc_req_match' [-Wmissing-prototypes]
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         |      ^~~~~~~~~~~~~~~


vim +/__acc_req_match +1392 drivers/usb/gadget/function/android_f_accessory.c

  1391	
> 1392	bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
  1393	{
  1394		struct acc_dev *dev = get_acc_dev();
  1395		u8 bRequestType = ctrl->bRequestType;
  1396		u8 bRequest = ctrl->bRequest;
  1397		bool ret = false;
  1398	
  1399		/*
  1400		 * If instance is not created which is the case in power off charging
  1401		 * mode, dev will be NULL. Hence return error if it is the case.
  1402		 */
  1403		if (!dev)
  1404			return false;
  1405	
  1406		if (bRequestType == (USB_DIR_OUT | USB_TYPE_VENDOR)) {
  1407			switch (bRequest) {
  1408			case ACCESSORY_START:
  1409			case ACCESSORY_SEND_STRING:
  1410			case ACCESSORY_SET_AUDIO_MODE:
  1411			case ACCESSORY_REGISTER_HID:
  1412			case ACCESSORY_UNREGISTER_HID:
  1413			case ACCESSORY_SET_HID_REPORT_DESC:
  1414			case ACCESSORY_SEND_HID_EVENT:
  1415				ret = true;
  1416				break;
  1417			default:
  1418				ret = false;
  1419			}
  1420		} else if ((bRequestType == (USB_DIR_IN | USB_TYPE_VENDOR)) &&
  1421				(bRequest == ACCESSORY_GET_PROTOCOL))
  1422			ret = true;
  1423	
  1424		put_acc_dev(dev);
  1425		return ret;
  1426	}
  1427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
