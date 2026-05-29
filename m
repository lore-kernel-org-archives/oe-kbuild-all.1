Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77C82E7379
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048527; cv=none; b=ZXj82+ys5W8rK7dh/9bEM4dKPXCCCtJJfOydBUvwNHDTyC5PYg3LdVSE1mnzTzSZtbwrrn20FVZypSjWaLmBly74TQ6LPc5OOkOqKzvyADOH6X7P+aiW8au+q6Uh5U2P0nYJWTLcJk/4/pjWaHDb4S1iQMBB6K+xj4WXZrGthro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048527; c=relaxed/simple;
	bh=p9J2To8yV71MORT1L8HRJvt3o7OYqFzj//C7BS9rF8w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpgWNYjPyxPdHGzrTOXQOfjZNxX1eD0I6Vs6sebT1uLlwpZujoBql3SqTS4FPttLThjvSLOyOPkZAYDCiJ7DdqxnxYPotCy55lrPHjVmZ9Pk+PI0S4O6Nyq2SnTXLMSNEM2fLox5TVAUINpI+7+hXUsIZBiaUviJJ+BFVauZGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT4/iqMq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT4/iqMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9735B1F00893;
	Fri, 29 May 2026 09:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780048526;
	bh=th9t6gvonqw8SbKlwwbyrJMvoYZDPmG9HmxdXGzmfxw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lT4/iqMqbH1+eojmTbdM6PQypcypkTfVPWEOFFt7taICZFQ6KEcsL0fnOwH/7e6I7
	 qZWjiOat2qllaULrvdoiHCBQck4tiQKE0DZPwn+Eh4+BBKfXbSmlTyV9P3x5GIiEdL
	 t/IBMa30Ur6JqtUW1L5LTiSS7jL87LS0QV3HuI3RoHBXPQF8fLgi+Hhz0HUiXeVXcU
	 Rizk4ueTCWBM4TG/ayZw1/8PW5rYEToHe00+8cVcadSkGSZB15jsM267dZJwdrPxeA
	 Gvlav2Xs4WaQW1gM3YR6PSLoJhen50l9fkN9jJYSzFbxEFExVfLCS6WDNHBFZvtccx
	 5jR7IG76EmWAw==
Date: Fri, 29 May 2026 10:55:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [jic23-iio:testing 242/251]
 apds9999.c:(.text.apds9999_read_raw+0x548): undefined reference to
 `__aeabi_uldivmod'
Message-ID: <20260529105519.051fb93c@jic23-huawei>
In-Reply-To: <202605291105.CBDnsmM6-lkp@intel.com>
References: <202605291105.CBDnsmM6-lkp@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 12:08:26 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   6f15decff24dac42895c0f01f0c2143f9b8961a6
> commit: 0467fb7ad204eeb42ed04db475ad05e6311a5c2d [242/251] iio: light: add support for APDS9999 sensor
> config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260529/202605291105.CBDnsmM6-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291105.CBDnsmM6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291105.CBDnsmM6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arm-linux-gnueabi-ld: drivers/iio/light/apds9999.o: in function `apds9999_read_raw':
> >> apds9999.c:(.text.apds9999_read_raw+0x548): undefined reference to `__aeabi_uldivmod'  
> 
Looks like one case got missed - I'll apply this tweak.

diff --git a/drivers/iio/light/apds9999.c b/drivers/iio/light/apds9999.c
index 215f3e8087c9..5285d148fbb5 100644
--- a/drivers/iio/light/apds9999.c
+++ b/drivers/iio/light/apds9999.c
@@ -197,7 +197,7 @@ static int apds9999_read_raw(struct iio_dev *indio_dev,
 
                /* scale_nano = 54 * 1e12 / (gain * itime_us) nano-lux/count */
                scale_nano = div_u64(54ULL * NSEC_PER_SEC * USEC_PER_MSEC, (u32)(gain * itime_us));
-               *val = (int)(scale_nano / NSEC_PER_SEC);
+               *val = (int)div_u64(scale_nano, NSEC_PER_SEC);
                *val2 = (int)(scale_nano % NSEC_PER_SEC);
                return IIO_VAL_INT_PLUS_NANO;


> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

