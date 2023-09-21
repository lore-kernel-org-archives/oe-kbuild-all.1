Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9087F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 08:31:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-532aaba8747so738632a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695285110; x=1695889910; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXh14rgGSApBO2RLl9u0ZXXrRj21CwmUeFVGgznRjnM=;
        b=cx7ZD13Em/dn7eA86TLAadNxkaBxjX8WJgiNm9tNiW1g+tmAgVwx+p4xRerGequBbf
         lS/BD6y0c8WhBCuF1PIvu59VfQVA9GXs6XCikhGe5XOZVRk0Vc2iExT0sT4/RDKGLxW5
         oIFMUnu3VlppFdfNhhKcflP2doXeFv0/mwPGjXFODDxC1xl8KcIMI+f86u9zbzyVJmx7
         a11bwO11dzyVTRQp2RnnT8Kl8OfzzrYr2sTGzOmNK16380SPTfQY8/L9l+I+/5X8+6y/
         qjcH3GCH4IZvUlrelrhHDdF0wnfDjSy1b39K0eEeDK+keUUaic7nuUSxKCz/ydGbBRgg
         8gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695285110; x=1695889910;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXh14rgGSApBO2RLl9u0ZXXrRj21CwmUeFVGgznRjnM=;
        b=JTm54VvLj5ylq1gd7ko0HP5RzK01k8GZZLuJWUscvbTJcsh+Lj6oXD5u4CC0p9ALF6
         QCLUT5Aq5Uc75Q99MpDdKcZCv58L1QZxk0P/NuIO7FaNrlYLPOtis+IOH+c2SmXBe6WT
         pIyfRhYodq0iqjwrsuQ91jd/BEM3QVSihSsfBX4ONavNxntnv3tr/l5fkcflKC4HSHeD
         QiFIcXeB7FpTBJzPwdIiC3bDCq34BgznkzRTKHoAUc+ZJyyBD2Z20mjak6A+SluDqrHv
         v4W6I69XP2G3U6oejRIL3JgTSbhfwbBsIxESaM2Y0DDfk7cikRi3UWMVx+vn75MNIpUX
         tsCg==
X-Gm-Message-State: AOJu0YxUpMt0edLdE6D9fLXbOsdsQ/x+wYMCm8P9Fo9/k+8A/0GbenIj
	rtJLQdoQUsITb4nOwaC0ziHKkA==
X-Google-Smtp-Source: AGHT+IEr/TZ2L2Og4nDs079VMm6BL7IG4jplnaZNs47eesIvvzhAJROzYLz9FpU6VIV+IDWDXCBIZQ==
X-Received: by 2002:aa7:c58f:0:b0:523:38f5:c5ad with SMTP id g15-20020aa7c58f000000b0052338f5c5admr4154251edq.20.1695285109782;
        Thu, 21 Sep 2023 01:31:49 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y19-20020a056402135300b0052fdfd8870bsm492257edw.89.2023.09.21.01.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 01:31:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Sep 2023 10:31:48 +0200
Message-Id: <CVOGEZD8EU2P.2NIMHV7AAUKR3@otso>
Cc: <oe-kbuild-all@lists.linux.dev>, "Bjorn Andersson"
 <andersson@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Subject: Re: [qcom:arm64-for-6.7 139/142] Error:
 scripts/dtc/include-prefixes/arm64/qcom/pm7250b.dtsi:44.10-11 syntax error
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "kernel test robot" <lkp@intel.com>
X-Mailer: aerc 0.15.2
References: <202309211630.0h14xtgj-lkp@intel.com>
In-Reply-To: <202309211630.0h14xtgj-lkp@intel.com>

On Thu Sep 21, 2023 at 10:10 AM CEST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-=
for-6.7
> head:   eee9602ad6498eee9ddab1b7eb6aede288f0b934
> commit: 8e2d56f64572e0432c355093a7601bde29677490 [139/142] arm64: dts: qc=
om: pm7250b: make SID configurable
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20230921/2=
02309211630.0h14xtgj-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20230921/202309211630.0h14xtgj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309211630.0h14xtgj-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> Error: scripts/dtc/include-prefixes/arm64/qcom/pm7250b.dtsi:44.10-11 s=
yntax error
> >> FATAL ERROR: Unable to parse input tree

For completeness so it doesn't look like this is ignored, the same issue
was also reported here [0] and I've sent a patch[1] to fix the issue
(though I don't see it in the archives yet, neither my reply to [0] so
I'm guessing the archives are just slow today).

[0] https://lore.kernel.org/all/20230921084252.3c5ab501@canb.auug.org.au/
[1] https://lore.kernel.org/all/20230921-pm7250b-sid-fixup-v1-1-231c1a65471=
f@fairphone.com/

Regards
Luca
