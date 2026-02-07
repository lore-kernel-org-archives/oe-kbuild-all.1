Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD60133F8A7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770461809; cv=none; b=ZRr5MXyRfukeYEoHBt1PmP8g3qya6hfhu0n7uHu9/A0gPMFhLRDqNXlanJSm7eIHc97Rew+WPifvZvxJkSjTpGNsyKoyv4niDs4hsTYUh5T9K1dKIpBk7/F+6BhdYiU96j5twj8m9IjBOOsTftVsTphGomBSlp3DP5OqKRwRqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770461809; c=relaxed/simple;
	bh=lNo2lIRGrPprukYyXSh3coXqFlSTQVeo11AHTGgLr9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ+gzpxDDLsFRIhx9qvsNIYg/CFg2IKmngKrAMKOrEnZP8y6XmdHY2H6GixqV1hsmRG4o4xTuRk7snGGiA/XAh5eNlMiaTq+//Hyg0p/+FpXhVkDWeCgEWLWRxvQp9HcJ54/r811A8IX7J97bjy/Dj11R/fHJnuldrbj7LSN5p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=L8BGMUV6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="L8BGMUV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770461806;
	bh=lNo2lIRGrPprukYyXSh3coXqFlSTQVeo11AHTGgLr9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8BGMUV6n3mpo2Zgrf45T/UQkCDk/76Qx5zVQ4D8jsLrltgqLcpMkdjuYF3imRo1j
	 WDc1+KL7yLIdsJ/fOjOGFV5fNJrmGNAvBcROCRpsk5i0ux2M8alYWJi8ZTKZcviQji
	 8GwtwnUqGgtzMcXoKDw0TPvqLH86b9Ur8Hss8SpI=
Date: Sat, 7 Feb 2026 11:56:46 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master 10251/12094] drivers/hwmon/cros_ec_hwmon.o:
 error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at
 .text+0xd2d
Message-ID: <4db66fc2-dc8a-4499-bc9d-c1f85e2ba4c1@t-8ch.de>
References: <202602071311.Q6tATiyh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602071311.Q6tATiyh-lkp@intel.com>

On 2026-02-07 13:14:53+0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9845cf73f7db6094c0d8419d6adb848028f4a921
> commit: 165c14597d53cfa7bc97b4ff8bc85f7bd98262b7 [10251/12094] hwmon: (cros_ec) Add support for temperature thresholds
> config: x86_64-randconfig-071-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602071311.Q6tATiyh-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/hwmon/cros_ec_hwmon.o: error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at .text+0xd2d

This is due to the call to unreachable() in cros_ec_hwmon_attr_to_thres().
Replacing it with BUG() avoids the issue.

Guenter, do you want to drop the patches for now and I'll resend them
next cycle? I can also send an incremental patch. Or you just fix it up
in your branch.


Thomas
