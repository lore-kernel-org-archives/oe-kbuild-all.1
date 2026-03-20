Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A44D271476
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989654; cv=none; b=cjDEzwPUFNqOv0ANKk6QxGBfJmKKgrCKj7wM6Czg8pH3BbJoIOOfkx3fmg1+RPD2SjRuztQEj/RUdY4hbfuhIcd8LLdpgcvt4XYTKu6CxfWrQV9BGQwPmWIgfgJDbybB60yyoWG0W7xL1csnwG77l+EYZV0ETOG1HwWWt738eWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989654; c=relaxed/simple;
	bh=XcX37NS8co0kd1RUBt/K2fbWlQ3cePtbir3Q5JG3SL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pSJN6CSmfveT3stWOVjTBX/8cL4GHqZTiEjrCQlkJ4uyFDAk+s0NtxkR1jtVT2OqU8wUkV/lKxyQ576REmtEDgJKRcJJ2NV+qhmFe69grZzq5FLW7ymQLvAbXg2t/2zV60+8fV1H6G20foxWEv1lqPLhnu0O1V5/tb0lWFlx7tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7927261a3acso2660517b3.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 23:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773989652; x=1774594452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDTfaz7geIw3Au+af8qVZ2ShZw/4WGae7Zwohx9s0eM=;
        b=bsrRH/kduEVw0HBZ4BWi+OvV4QD2L0HkLHoW2Hn/lzgo45OEO8LbOoVFNkfz0jHwdP
         2/baGde+ntoBZKLlEVMTZ8JeCM9/3aukuCZ9/pXYhbCYXewfJVboJHRmnKUzsOzeL6wd
         OvPzr2D2GWS8eKzV0q01wKA6OSzCcGi4nSwgKpNmYwCasZdcv8newuf4BlEn7QEpX9cu
         GDArBSo77qiM1eGXSGyfJ6L7i8RbzrItGVLjvsi7ppWSsxO5x9KCtajmkLU1OG7NDf9E
         /ZLxOi/iE0CTuEC8ei6zqB65+zZvuLIxdyQL2LWvzmUf0ZQx0tq8iuxKtItvInbVgfiU
         Luag==
X-Gm-Message-State: AOJu0YzkDkVHpD04D6ufQtdCiaz0LPh8Z9Se8dsAq1kqhl3wGgWPDxVm
	i4+ga7DGEnv7MgTKyvLpb6XmunEVxMFBfMKS3f4nwBFwtcjga6M52F5r2fdpXw==
X-Gm-Gg: ATEYQzwML07kSR5TDXNiVEEOjqsWgcwXG7j/c4CLACA48hLejLHSpdRC0W2+vXDXQ69
	NMjR2n7r+hSCzkUMMAa+2bslfN4Bu1oHviJkiWbhoHFA8832eGbsG+f1E+aMNC5YVYqYPoxPGVT
	S9wJ2PETnEQUcnkZB1dUyMBJ45G6kI6i/8grFVuwMXln6F9V9ljeB034Dn9rqfQyaz+tOB28Esz
	z0iusJEjiAL5A+yL2QMeH7/AgsNdm1TeDNIZTQyDdzTw/YsoGEZSflQVlvZH8rj3+76q29b6B7F
	3av6BiXSMZ2ujc7WbSGTat2L4XjeeN4WdQ200HwbYL7kd8OVB7ZbSp/Oq9ZkWy07XCs0Z9m07iC
	zUIFu9irwu6Tw6xusIC85azsGq5wL1tJJtlWeuGv5PPs0i6qSd8U/OHvhpazPo7nmu/I1mRqQYE
	MG7BLWbiZcgpiFJjvbdC3zEc8E7Sf8/6gsEM41mxqUaLrbx3Gxye6dZw==
X-Received: by 2002:a05:690c:6d83:b0:79a:56bc:2464 with SMTP id 00721157ae682-79a90aa3f3bmr19978307b3.11.1773989651957;
        Thu, 19 Mar 2026 23:54:11 -0700 (PDT)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com. [74.125.224.43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903a2d78sm10976357b3.4.2026.03.19.23.54.11
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 23:54:11 -0700 (PDT)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad79df972so312095d50.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 23:54:11 -0700 (PDT)
X-Received: by 2002:a53:d056:0:10b0:64c:a4ab:e4e8 with SMTP id
 956f58d0204a3-64eaa6c04eemr1750556d50.20.1773989651111; Thu, 19 Mar 2026
 23:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603200535.6UZ5hO6U-lkp@intel.com>
In-Reply-To: <202603200535.6UZ5hO6U-lkp@intel.com>
From: Roger Shimizu <rosh@debian.org>
Date: Thu, 19 Mar 2026 23:54:00 -0700
X-Gmail-Original-Message-ID: <CAEQ9gEnxHkq_D8EAoWEg+NMig71UuAGecmwaTNSNdD6HVj-0Fw@mail.gmail.com>
X-Gm-Features: AaiRm50q95ROtJikAOOr-L93Z8BFO8yfW8wwbpDWNvN2fpL4lnacYrcITpa08xs
Message-ID: <CAEQ9gEnxHkq_D8EAoWEg+NMig71UuAGecmwaTNSNdD6HVj-0Fw@mail.gmail.com>
Subject: Re: [linux-next:master 6933/7683] arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb:
 pmic@2 (qcom,pm8350c): pwm:nvmem: [[368, 369]] is too short
To: oe-kbuild-all@lists.linux.dev
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 9:42=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b5d083a3ed1e2798396d5e491432e887da8d4a06
> commit: 1cde54c54b83b33b49b9fdf760a58a7e6689789c [6933/7683] arm64: dts: =
qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
> config: arm64-randconfig-2051-20260319 (https://download.01.org/0day-ci/a=
rchive/20260320/202603200535.6UZ5hO6U-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 15.1.0
> dtschema: 2025.13.dev8+g0515abdd9
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260320/202603200535.6UZ5hO6U-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603200535.6UZ5hO6U-lkp=
@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/kodiak.dtsi:5357.26-5432.6: Warning (avoid_un=
necessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unneces=
sary #address-cells/#size-cells without "ranges", "dma-ranges" or child "re=
g" or "ranges" property
> >> arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pmic@2 =
(qcom,pm8350c): pwm:nvmem: [[368, 369]] is too short
>         from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic=
.yaml
> >> arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pwm (qc=
om,pm8350c-pwm): nvmem: [[368, 369]] is too short
>         from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg=
.yaml

looks like it's the same as reports below:
* https://lore.kernel.org/oe-kbuild-all/202505311156.VMtrBeWr-lkp@intel.com=
/
* https://lore.kernel.org/oe-kbuild-all/202506010127.Kbh43JmW-lkp@intel.com=
/

if there's a fix, we can fix them together.

-Roger
