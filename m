Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F533382D6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770482626; cv=none; b=TuOoSsUHw5N8GpX+XjS0O4m+qfBS6lsJjHOwpckiRCXzBw1r/c+e4NIKw0lmiR9cfgzdnx2a/ExMc7DD5sAzF3jwJeCcVH+HiHR8s3yWtos1grGhpMUhKAXYf6knSNgtyxOu1/Dc6lYKQYUfep83wxlPak3mvUi0usE0R2GcgD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770482626; c=relaxed/simple;
	bh=ZyZinMowOXnHDT3mlAwQjIJ9IBfKqaOq8w2aD0MPfGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=au4YpQM4n2ltDLz9/bGQ93RykhiCHTD+SakjshVpfxTdxq51fTn3SF7u8jp1n8Xq2mWAc9ta/UwfhlR+oCUIi2JeexCLvsnfZBk/CLIWW8x24bzxS+BY/jSUzG9qTAg0xNCTXHm3yE2GUlIWBzC5SSto9c2FG4D01FjbGLYh0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lP4jxssx; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lP4jxssx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770482624;
	bh=ZyZinMowOXnHDT3mlAwQjIJ9IBfKqaOq8w2aD0MPfGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lP4jxssxpV3Ys1xhesh53WhXxttB4hhD4DM6ImDyDhQ2YK3BaNfMrSEHHL8x6UlS4
	 WZBbNQNSQjdTOcsNUFvqZOGs1B53i4SA8Fyyx5mKzqYffPE/w3ipkGyKfE58FKmn7l
	 /xQ3QEU3bpjaD9vhBE9zCxSDmnAhh3DbPHxRbV28=
Date: Sat, 7 Feb 2026 17:43:43 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master 10251/12094] drivers/hwmon/cros_ec_hwmon.o:
 error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at
 .text+0xd2d
Message-ID: <9a2bfcad-f5b6-42c1-92fb-c8348909c909@t-8ch.de>
References: <202602071311.Q6tATiyh-lkp@intel.com>
 <4db66fc2-dc8a-4499-bc9d-c1f85e2ba4c1@t-8ch.de>
 <957068ee-7368-4fd1-9e55-1449414238be@roeck-us.net>
 <317af5ed-fc8b-42d7-aa4a-143f8cf3ab04@t-8ch.de>
 <8edcc901-04aa-4d8d-a357-8653e29327e4@roeck-us.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8edcc901-04aa-4d8d-a357-8653e29327e4@roeck-us.net>

On 2026-02-07 08:26:37-0800, Guenter Roeck wrote:
> On 2/7/26 07:33, Thomas Weißschuh wrote:
> > On 2026-02-07 07:07:13-0800, Guenter Roeck wrote:
> > > On 2/7/26 02:56, Thomas Weißschuh wrote:
> > > > On 2026-02-07 13:14:53+0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > head:   9845cf73f7db6094c0d8419d6adb848028f4a921
> > > > > commit: 165c14597d53cfa7bc97b4ff8bc85f7bd98262b7 [10251/12094] hwmon: (cros_ec) Add support for temperature thresholds
> > > > > config: x86_64-randconfig-071-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/config)
> > > > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071311.Q6tATiyh-lkp@intel.com/reproduce)
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202602071311.Q6tATiyh-lkp@intel.com/
> > > > > 
> > > > > All errors (new ones prefixed by >>):
> > > > > 
> > > > > > > drivers/hwmon/cros_ec_hwmon.o: error: objtool: cros_ec_hwmon_read+0x6c: can't find jump dest instruction at .text+0xd2d
> > > > 
> > > > This is due to the call to unreachable() in cros_ec_hwmon_attr_to_thres().
> > > > Replacing it with BUG() avoids the issue.
> > > > 
> > > > Guenter, do you want to drop the patches for now and I'll resend them
> > > > next cycle? I can also send an incremental patch. Or you just fix it up
> > > > in your branch.
> > > > 
> > > 
> > > I strongly dislike BUG() because it means "I don't trust my own code".
> > 
> > Agreed, I am not a fan either, which is why I used unreachable()
> > originally.
> > 
> > > The final "else" in the code is not really necessary and should be dropped.
> > 
> > That will trigger a compiler warning:
> > 
> > drivers/hwmon/cros_ec_hwmon.c:170:1: error: control reaches end of non-void function [-Werror=return-type]
> >    170 | }
> >        | ^
> > 
> 
> I meant something like
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index 5b998cd5e506..6cf5ab0f4b73 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -165,10 +165,7 @@ static enum ec_temp_thresholds cros_ec_hwmon_attr_to_thres(u32 attr)
>                 return EC_TEMP_THRESH_WARN;
>         else if (attr == hwmon_temp_crit)
>                 return EC_TEMP_THRESH_HIGH;
> -       else if (attr == hwmon_temp_emergency)
> -               return EC_TEMP_THRESH_HALT;
> -       else
> -               unreachable();
> +       return EC_TEMP_THRESH_HALT;     /* attr == hwmon_temp_emergency */
>  }

Welp, that was easy :-/
Let's use it. Feel free to apply it directly.


Thanks,
Thomas
