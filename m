Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1766FA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Dec 2023 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TlT/0pvX"
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso2572330e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 23:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1703749691; x=1704354491; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGr3Jb1kUUvaTFJpSrcPUwei0EV8o4OwF2pe01sQlm8=;
        b=TlT/0pvXKNHlhiYcokyomOqvFjXpBfNr01JyaJtvjpxHgwX6pSOEWt1CtuDQ+EM132
         xYTQJcQr0AQLMsHv6Eutmw3suamQ5aV6+8JCTeEaxGPVEqFg8jc71eEx9GcNKl02kMW1
         OGTquyHueN3sv1ZRLIsulTFmjy+uqQq+6c4KcDWccWaE6g56nArI8WLNQuB0wWJ8xPGN
         nQWqBdpix6ZtccmQ5ykARWH3dSGwYH8Vbshf2BDWULzG7YHaV/naXoBPNQj1/GSITRTL
         chPzhTo7j665oCJoInE0EeBOuKIxKed+TlYCJHy7TqPu8QoP/PB6P0BODMXHlME3bdED
         EKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703749691; x=1704354491;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kGr3Jb1kUUvaTFJpSrcPUwei0EV8o4OwF2pe01sQlm8=;
        b=M4+dNA4SHYAdgFcsUVV7OYf3vyc1ih2K7ZRM2vLf7oC1K+ZTfeVpn7XjBKA4IXYkp7
         v7G+UnoLESeW1d9GDiYQCxRFP/h2YiEav1WkSC3bCUkewc776J/T7u/qp5rMjdu+PrAw
         Rmf+bxbvIP7IW3vUIfoo4aALR6+FZ9Lav9/EO2ufyncF2gqaftKxFANHj+5MsMUFo8UA
         zsYXYeImCr9cZe1zpdBnf0e6Bn5x0K8AI31ngOFbj9pJg3qj+ASEXo5IoFRIBsxURXZd
         XU6FmdfuJ2Kfk4IfESId9ioxUnEdE/4Gzm6HI2qtHTKOmIHfi8cJEmKJO7OT2PZ2HGlk
         Xnfg==
X-Gm-Message-State: AOJu0YzkLUdzMoGLhDVy1X6dEQxX95Zxfikne/ezevii2tbsS/y0ie3p
	R+neJ07CcftAm1qlwN1IyaytOATBI7ntZg==
X-Google-Smtp-Source: AGHT+IE153MQG0BpE8shs8iU209KiVsjfqeWG6GW1EqkvorXIpjahXvBEEApFyBHKh96L/YKFsTtxQ==
X-Received: by 2002:ac2:5feb:0:b0:50e:6459:529a with SMTP id s11-20020ac25feb000000b0050e6459529amr4203605lfg.21.1703749691363;
        Wed, 27 Dec 2023 23:48:11 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id mf20-20020a1709071a5400b00a26ae94444csm6408948ejc.24.2023.12.27.23.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 23:48:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Dec 2023 08:48:10 +0100
Message-Id: <CXZSUYSSLE12.3104IH394QMNR@fairphone.com>
To: "kernel test robot" <lkp@intel.com>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>
Cc: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>
Subject: Re: panel-raydium-rm692e5.c:undefined reference to
 `drm_dsc_pps_payload_pack'
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <202312281138.PHn1Js8S-lkp@intel.com>
In-Reply-To: <202312281138.PHn1Js8S-lkp@intel.com>

On Thu Dec 28, 2023 at 4:46 AM CET, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f5837722ffecbbedf1b1dbab072a063565f0dad1
> commit: 988d0ff29ecf7ab750b9be29fddae588156c3d03 drm/panel: Add driver fo=
r BOE RM692E5 AMOLED panel
> date:   3 months ago
> config: csky-randconfig-001-20231228 (https://download.01.org/0day-ci/arc=
hive/20231228/202312281138.PHn1Js8S-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231228/202312281138.PHn1Js8S-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312281138.PHn1Js8S-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    csky-linux-ld: drivers/gpu/drm/panel/panel-raydium-rm692e5.o: in funct=
ion `rm692e5_prepare':
> >> panel-raydium-rm692e5.c:(.text+0xfc0): undefined reference to `drm_dsc=
_pps_payload_pack'
> >> csky-linux-ld: panel-raydium-rm692e5.c:(.text+0x1090): undefined refer=
ence to `drm_dsc_pps_payload_pack'

Should be fixed by this patch (which doesn't have to have been picked up
yet though):

https://lore.kernel.org/lkml/20231023115619.3551348-1-arnd@kernel.org/

Regards
Luca
