Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C06135
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 16:19:06 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id n186so2372180oih.7
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Nov 2022 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A8DgaRwttB9hjCW6SoE4EW20K7xuhiFWX+wL5BBTtGY=;
        b=EB/lKKf5RxoF6hImdQe54nHhwrOf1Xpuw7LcLnkElq+s9ZspvntfXK6WBBkYB2Jtoz
         kf+Zjq0Y+1QHZP0t6bitwAKz2fwsQ23ENx6VHP6LdAyk1i+lxIBQTK1eZS98rqYtjBm+
         P5rWFBcHTFijsQ4ENq0QqFuj/SoU/HANkUOsqG53hL70rWmDt8mNfD5TPF3OrWX3WLQn
         Wo2NMXtf2OyiuCiLqHZnK3p+dVI4ekbNui/Ti28JJ/CTL5vzsJUJ1u2Ey9yImOIBRW7R
         jgyXTgIOkOhPStqSXA+Is2C7a1Ef5pdWk8JOsVn+Sy9QwrZ1KubZFrmXXgpTs9WwhVSJ
         7UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8DgaRwttB9hjCW6SoE4EW20K7xuhiFWX+wL5BBTtGY=;
        b=iGno05vTRjjqmLQJL4r7bzIexw/w0KYGp5RdAWqu0X8wcX7yvA3U6/cmdzMPFTflQ0
         vekbu/Ug01m8idbLEXmyx6Zxhr47aSpSqdPLjs5WkuhQUgbVyhws4TqHEjj4rP73lwB+
         7pTJXme2dcB6+RGQslQRYs0J/Ik6kF2Geo9XECZ9jORlLcJrW4SwRFe9R6Hq3auxvm/I
         AnfXeVv4L8/9gnBLl0vpGMyn8qi3gvkeJyachWBo+mrhCCoZ3yK35VYv5Z4JJNLqlAr8
         WVmvXzk/khkzZDM5iZBkEKfwf5unHOcenWXFIcw+lREfimG0CWUxt3lCxgb+3pLFDtdG
         k51g==
X-Gm-Message-State: ANoB5pn05bfm+kd1lYXgJPr2VgHTIKCOX5hUE0YGnDhdzgNgCI137aYK
	xVSOJPACMO+fEt014dtxIOlzCEThAmxCbC1VEDA=
X-Google-Smtp-Source: AA0mqf57WFszwrww6GcJY+HkbE1NkbteAaGentZxKF+CSccKH43WJCOiJBlgO29WBn9IEFbXKts2tvvByijmGa62jyA=
X-Received: by 2002:aca:60c6:0:b0:35a:51fc:2134 with SMTP id
 u189-20020aca60c6000000b0035a51fc2134mr1502097oib.144.1668701945399; Thu, 17
 Nov 2022 08:19:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211172040.wmwvU7o4-lkp@intel.com>
In-Reply-To: <202211172040.wmwvU7o4-lkp@intel.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 17 Nov 2022 17:18:54 +0100
Message-ID: <CAMhs-H8BLheXBc+BcDH_PKmDg+_bWF9OmiS_grw1mO+RxW+J8Q@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 3342/9999] ERROR: Input tree has
 errors, aborting (use -f to force output)
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Nov 17, 2022 at 1:25 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> head:   3df0eeae4d9a547c0f19924952ccb8290582e5d0
> commit: 127a5d3e732df7d7fb5bdbbaca3acdd679003605 [3342/9999] staging: mt7621-dts: fix GB-PC2 devicetree
> config: mips-randconfig-r005-20221117
> compiler: mipsel-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=127a5d3e732df7d7fb5bdbbaca3acdd679003605
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.15.y
>         git checkout 127a5d3e732df7d7fb5bdbbaca3acdd679003605
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/staging/mt7621-dts/gbpc2.dts:22.28-26.4: ERROR (duplicate_label): /palmbus@1e000000: Duplicate label 'palmbus' on /palmbus@1e000000 and /palmbus@1E000000
> >> ERROR: Input tree has errors, aborting (use -f to force output)

It seems the commit pointed out here was ported to stable and the
state of the device tree in staging at this point was not ready to be
mainlined yet so some errors like this one appeared. This concrete one
is because lowercase for hex address is not used in the mt7621.dtsi
file. This was addressed as other errors for v5.16 here [0].

To minimize the changes in the stable 5.15 inside staging driver, the
easiest thing to do is just convert palmbus address to upper case as
it is in drivers/staging/mt7621-dts/gbpc1.dts and
drivers/staging/mt7621-dts/mt7621.dtsi.

Let me know if this fix is ok for you and I will send a patch with the
change or if we should port all of the changes in this done until dts
was moved into its proper place [1]

Best regards,
    Sergio Paracuellos

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/drivers/staging/mt7621-dts?h=v5.16&id=ce835dbd04d7b24f9fd50d9a9c59be46304aaa8a
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/drivers/staging/mt7621-dts?h=v6.0

>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
