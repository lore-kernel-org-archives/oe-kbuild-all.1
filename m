Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98D21E9B3D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800292; cv=none; b=h9vczWYKYAYa3bpIQyZ9HV3sXAGcSm/TQXcixW3qfNmD4I967wjKqDbrXVq1tSAqMUofNi1mX+3lMAZYPOQ1UWrnk7E+yJ4lfuryd72ycP/tlTnVMDc1i02f1L0kPze0eNGFCabbuDEjifKqZ4B/MdLQIA6nRkKCvAAYqzgmwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800292; c=relaxed/simple;
	bh=AriWz4HqW26ctPqGz9ZN0FosV4VfN5Vrz7wbOia0Its=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PahO5E7/g8Fdyjm33wslAP9idxq3thomRz0Uz6fpWP28QYDcZPlgFiufYK6fHG+wClF1d4KKSaY1ST8sfiqUUhzO2YAScwABcHbpwWSZxmFD2WJ5sQrCmAICPBXKTApuspxGjcOw7hanBBnciaai5QmzHvJ0EaQQQ0u+Asb2MME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmJvRL5f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmJvRL5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772800291; x=1804336291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AriWz4HqW26ctPqGz9ZN0FosV4VfN5Vrz7wbOia0Its=;
  b=TmJvRL5f/sD1wxqhfhmYpKWPGZFwtuWUvogwWbVemliFY0M245fi5j3Q
   kMIax6wVHHE0WX9/IOV3pWJtf61aIY33R+zDc2bWf3K112X8RasT/MPJr
   ZPBimD8UchTdK7pNi0KpZfdSMHfF4G4i5BfagZKDlqXYhAdN0riP62iFb
   kGyfYyRijPu/z2pnSXL55tiP2tdvdwseB0sN3B+jk94Sfn2S5savPKUi0
   Hd3Ow94nkZo6ZMW0mE7HIeTq4i/hdWEfre+QsFqJ6OaAaAycC7kHBXjTl
   TIgi3JeR5AJNIXWTZsDsrQCRiZFULO7FjfJAU135IVDvQjLrX/ygah/pV
   Q==;
X-CSE-ConnectionGUID: WXzngctlRuCIbfuqVoppSg==
X-CSE-MsgGUID: sMkyjUrSS4aLOaPJLmkNPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84617715"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84617715"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 04:31:30 -0800
X-CSE-ConnectionGUID: wuYI1cyHQCiz/Ql7KM8wqA==
X-CSE-MsgGUID: SMhp1FmwRgKT6HrpvpqF4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223975526"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 04:31:28 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3100E120279;
	Fri, 06 Mar 2026 14:31:58 +0200 (EET)
Date: Fri, 6 Mar 2026 14:31:58 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [sailus-media-tree:cleanup 30/33]
 drivers/media/i2c/ov9282.c:557:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <aarJPt5iOQmn3ajM@kekkonen.localdomain>
References: <202603061953.Dlyggyec-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603061953.Dlyggyec-lkp@intel.com>

On Fri, Mar 06, 2026 at 07:47:06PM +0800, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git cleanup
> head:   862cacec7d570b9f6c8d60d12b50a210aecd933e
> commit: 1f01b1dc2c4922f684a5992e7542cfb03f90223c [30/33] media: i2c: ov9282: Convert to CCI register access helpers
> config: microblaze-randconfig-r062-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061953.Dlyggyec-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061953.Dlyggyec-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603061953.Dlyggyec-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/media/i2c/ov9282.c: In function 'ov9282_update_exp_gain':
> >> drivers/media/i2c/ov9282.c:557:2: error: a label can only be part of a statement and a declaration is not a statement
>      int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
>      ^~~

I moved this to where the rest are declared. No need to resubmit.

-- 
Sakari Ailus
