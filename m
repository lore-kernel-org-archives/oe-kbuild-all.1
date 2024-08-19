Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230FC15B560
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058102; cv=none; b=b8kqAVlkot1S1a8DkAKLvvhI7Q1oTzTYE5HQWUhK5O+Zp/nSgDnB4lnd9TGeAF3ISPvM4sAUC0tP2SeL65ouokB0ji28MB6r2JFKG51Ao4ej1YCqtXgbb0+nUv8+zs+iGZdxlgbj60XI5ycIdwWdOTpY4ke7l4zAYCf9j0ZH8dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058102; c=relaxed/simple;
	bh=m/xcp8WHkaMLvrCgYf8akDj1ciV6qBQWwVkg5I6rQnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vw6MJ54yZdiQkrwemXvcurC3J0HNzuAOGFdEj5MGzCEj83on6RF7laLppwGqpKANXadqOIVW6P/RiGwXq9gbWHKkydg8lRtUJ3U2n1pbVsDl0fO2RsH6Waw9RSgxrpjKkMckt20SL+JzXshwDrSpfWO5h+SCicTDNYH550YMi0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IWp0Rzig; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IWp0Rzig"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e13cce6dc85so2090808276.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 02:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724058100; x=1724662900; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a7AS8UeYvMlobVHqZ3HsCtcHM/UyNGPktl3wJUy55qc=;
        b=IWp0RzigoXhyg3i5+NVjBvj2XLLIK7y2B6kaL8DC5R1rBlmgk/2opWB0e2fJat4bXq
         X3wmZNCNML0Uf73kR6ds+fQU2bOXCqDJaOUOhmf6BeFy7UxVNN74Ru4tnalvPsG2jTJ8
         3kJY9jFPSAIEE59N3rgJ/gMbr7yqrdjRx1ars0WOfZcvb0eiE9lVqi/OoISs6cpuL33A
         XH6Oz2U8xw5Wqp5btv4O0yc/iQyc1ztbGJkEGYtVDVjoaQn93EyNNECxWrs1JBjFsh7p
         XmhAbqSfht7Ie/vEouWhg2P1sSGiZrRKZvgHSRIcaVM0gSN7h+EARhRNH5Rrik3GyAg+
         3MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058100; x=1724662900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7AS8UeYvMlobVHqZ3HsCtcHM/UyNGPktl3wJUy55qc=;
        b=gwkxILNgLCVPiVplj+Ux5ShwATIQF4uFz69/swpGOAFD/GpzoSkB1mFOhr3hNMCxFB
         FzFULg6DMbEvUG4HIxaNrIec1g6eNda/0Ucx9ivh06PKwRaJz231ZgScvg0pQbjDq6rY
         rkH1/Sh4hiCW7BLVIw2FIWMb2S01wCyZ9NH3oXW+HStfjidG4KbKaeKwvWXgabpX/Dqq
         FGzzGAJ79UvlrpZjoNwOEPRkwMIVBhlNNf6x+kM5f6MWsovT9lV6tfO0l63I1hDHFyL3
         Bf8LOiAyzigAlBaOfaiu75lSNWmB8Gicq/2jgqY5FVDlVFjYMXwIinoptoFnu8/KK7RD
         l69g==
X-Forwarded-Encrypted: i=1; AJvYcCURq6Y3qp2M0Gxwo/3is4SvAXGImzyMDQrtYV9tUfVUyORWXlhuZZaw09dQRSliT5GIERn82f/ndSSD02E6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6SVsaq4jFQSO2jAGv6AJd1aXFfZE8Uj0nWAaTlLq7/n0AAmAa
	AWL7IyL/Q0D0DGpcVjzGASqYaMxe+8padm5NcBDBHwHJQEwAqGMYcw9FPu3r07LbEHM7kcbEzbl
	5VUwDaYFQkTTjWaHO++6MuVkgo9U6vTGogtPKRlz/HAYDplYZTzo=
X-Google-Smtp-Source: AGHT+IFb8kBWaavswdWxkEapoXhfRO66dpv/CLP1gbeg91+4MbqfFUrvP1++xIwQfFtuNUUk3xtUbEPpbC9WeFfONa0=
X-Received: by 2002:a05:690c:288:b0:6b2:7bd8:d7a4 with SMTP id
 00721157ae682-6b27bd8db28mr86189407b3.41.1724058100135; Mon, 19 Aug 2024
 02:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408170533.HwV84hBp-lkp@intel.com>
In-Reply-To: <202408170533.HwV84hBp-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 19 Aug 2024 11:01:29 +0200
Message-ID: <CACMJSeuWd8etAV8LbeHTm7pUFDK16bKBAbdK-yJjbF_3FrUOLA@mail.gmail.com>
Subject: Re: [linux-next:master 4788/5190] arch/arm64/boot/dts/qcom/sa8775p-ride.dtb:
 remoteproc@2a300000: glink-edge:fastrpc:compute-cb@1:iommus: [[35, 10561,
 1184], [35, 10593, 1184], [35, 10625, 1024], [35, 10689, 1184], [35, 10721,
 1184], [35, 11585, 1184], [35, 11617, 1184], [35, 11649, 1024]...
To: kernel test robot <lkp@intel.com>
Cc: Tengfei Fan <quic_tengfan@quicinc.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Ling Xu <quic_lxu5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Aug 2024 at 00:03, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   367b5c3d53e57d51a5878816804652963da90950
> commit: df54dcb34ff2eaabc5f74afbdb2fec104e2263e6 [4788/5190] arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes
> config: arm64-randconfig-052-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170533.HwV84hBp-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> dtschema version: 2024.6.dev10+ge5d88ac
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170533.HwV84hBp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408170533.HwV84hBp-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
>         from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>    arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

Updated bindings are now in next.

Bart
