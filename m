Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793409851;
	b=iTSLQJ6tsmFJERTQT4fK7sMQ4mdw2QKp5oKQY+e3yAgTGOatCoB5XMysvViK0fGzAGLc
	 QkelJ286/bWQmufcDNTRq67ofw8gjwjZ17sryCZHiv5RNfsvGFmYZaXaS1sDwcdsKGJqy
	 Gs3mhFT7bk3LNLcfzEwWReiFggRFFckM+gQDGhIyc1Zxd3xwRhczRdFsYX1NO+xENrSpp
	 iQrDpPP3ZE+tizARJwijmmL2Xfrs8xfEX5twe1u9+lWh/9djcXhEIObOsW4GED/59ckoY
	 tWqHmDLUORaiJK67dI23uHnvhoXMWrhZ7UqFi3bdpgHqXBk1xygfs2RVxEPRBzMr/mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793409851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/bTTjj8n/ts39yLomRcVpuIj0WjaFRlNCsiPPRonh80=;
	b=Bk6uIxzVFlgCL9jAKoDy4PNg2aNXSn4V5cBGy0BFaP2AIyvLe2ybMES18DAXAH9HcxxA
	 dQtTnsLJpbr6ImhvecR5eCiBFTf7PSWgnID4nn0/H8iVfOqEEzWR7SFaVDZN6/pRmqhIM
	 7ERXb5MaUo+HLlmtOsknIHrzWSbPjpuJNtq8FodmUYtRHqpyKfwbkItfZt+g1EPAsgHid
	 2ba62aDfLY0W0P+dXzFllwcfXLy42uHfg24FYxP5WlUwafgVRk3+ykmBDQgqNB6Pzbnf2
	 Zy68mEP7aSYqv+dtisB+YxNa5/JMaAwKx6ga6sxQQ/0eNUJ0hmRmZ5RyBCEMq6hT5yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJIMsVt8;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A4C606A320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 01:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A4C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJIMsVt8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793409847; x=1824945847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YUY4SZ+Fxv6EF7SHsc9znE54cxaG4yTMfXDhf7S41o0=;
  b=LJIMsVt8IJvp+60uuXos4izZxHgUsfZQnop/Ifw1JmR/P1+fXVHxeEyr
   Vu98gJO+Ci4JPWq2YknZixMiJl0pK3JYk5dwAltThV8kPVSqgsWUhrigz
   M88Zs3SKyb8QP5J4xNgnRh5T0YNXRGIuuCMdZpYDCq9UaoY1bnA8yLlPb
   wAzota1WGyiUxmPP0FlvYo9UnNcLnA3MY2w6XxZX9gvSVdzKagdVQY06v
   w0utLwA7S3xOZw5ARUsj7oDXc4fagF8U8tf+nG/nAThU2Rwa2Nws4IUba
   VKDXz6H5nogR/u1kXLrRmUbCJPtBHRYFS96SMrhR/NWkOvvOwlwjlsQPL
   A==;
X-CSE-ConnectionGUID: PBzwFiytR7OD6IWkzpZ0MA==
X-CSE-MsgGUID: q1zGsSVWSLuSNCxe+1luRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2071716"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2071716"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:24:06 -0700
X-CSE-ConnectionGUID: XPJUpvmdR0Sqa12yYvTrOA==
X-CSE-MsgGUID: wbKxthZwQamUMnWMhHnqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5915287"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2026 18:24:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMxpC-00000000cQO-3Pry;
	Sat, 31 Oct 2026 01:24:02 +0000
Date: Sat, 31 Oct 2026 09:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: ahmad baghereslami <ahmad.b1995@gmail.com>, dmitry.torokhov@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: Re: [PATCH] Input: synaptics - support the touchpad LED on RMI
 function $30
Message-ID: <202610310804.T0iDq0C6-lkp@intel.com>
References: <20261030070821.1716595-1-ahmad.b1995@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030070821.1716595-1-ahmad.b1995@gmail.com>

Hi ahmad,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus hid/for-next linus/master v7.3 next-20261029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ahmad-baghereslami/Input-synaptics-support-the-touchpad-LED-on-RMI-function-30/20261030-103821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20261030070821.1716595-1-ahmad.b1995%40gmail.com
patch subject: [PATCH] Input: synaptics - support the touchpad LED on RMI function $30
config: um-randconfig-1000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310804.T0iDq0C6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310804.T0iDq0C6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310804.T0iDq0C6-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/input/mouse/synaptics.o: in function `synaptics_disconnect':
>> synaptics.c:(.text+0x22dc): undefined reference to `led_classdev_unregister'
   /usr/bin/ld: drivers/input/mouse/synaptics.o: in function `synaptics_init_ps2':
>> synaptics.c:(.text+0x406d): undefined reference to `led_classdev_register_ext'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
