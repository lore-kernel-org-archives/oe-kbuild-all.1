Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9918FDAF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609672; cv=none; b=PMBCuqBw+tQZ2CR7YnhdJUQ6+Rbtw+yP4RkzF5smFN9wIfmINUCBwxKEwD6AGTWxKFzW1u5Iqs4JnYVMI5Gq7uydPSmSmCE/YWArMaesHys5gJPrBoHebn9ik/08sj6r8oNLFns0hoq5LwoupJ0VLDDuC+qrhxoHY6Pu9wUzsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609672; c=relaxed/simple;
	bh=R0o7TrGhqODKpNWXbMzpDQ7iYgs+7sTBx4yxIhcJPRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvq0/bRvFKxAG9l8gN2zZUx6cPAhQT8bC3SoSPiiIUtERYVtUgcQW7Rr5aeoE+EXjIlUm5IzED6pQxx/zDbbTlI05N0J8ZL+HpNOIceK+xnO6yfueQSgIZbF4za+XlxvJy+YDgNp+pj7L9610RMb6R57tmVVMzKdVunhzwcCfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Iv6E/9Yx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Iv6E/9Yx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f090093d8so3225626f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 00:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718609669; x=1719214469; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/okSSlfq1HEJ/g6QWrHnUfVaTfNc87YbM14VZ347qk=;
        b=Iv6E/9YxKvlgRYSAu082tAOMWnHSnNFZnu/OJdzNRk3DzEFLrssYTIqvu4Qmg6mCaw
         WdIya+G2Ld/Olx3LV1iua8k93BVa+pYBdTHqMfMd/SU5F8sYt2LEZdU7XcYRn5HiqVka
         UKjK86SUd1vJB5NV6w8mtJNkSuONderBYpO/ZKJ4nT7S9AknkP6YWesgmC8xs74rRHdK
         AHIEFzBg9TvOKyrzv4h85cx0VSVN1Qnp44CvXqoG67CTiefxqFquA7nm+URstvAa3MWu
         fylrY+/3q5fCLthFdwkaEIQhKaUJB/QT2j+JymDCjOlYMFJMKwXh6VLEK9OLh/wR/2oB
         VaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718609669; x=1719214469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/okSSlfq1HEJ/g6QWrHnUfVaTfNc87YbM14VZ347qk=;
        b=eGLoWoOIHhxaBtmGSNN6asFju56VHSNJ17MCAncqH/3GbPfqLIMhwftFkOu5+3rq8C
         gwguU1t0gQgwL6i/bgRLoCCCSTTHOgOUNjgRCRzS7Fx817+E5ENh08+uBGh2oiBJJAEc
         9fTvhspE3enwDojdBQJd4or7oolIMADbCtNBLGW8Rjo6DXAjXXkDBOUjYEow/egpUNuI
         lkyyfiL3kHdcleMG5dRE+WLN/UDP/Pve8ONRLrAPcg6uuMc0B+sBe8cMzOP75J/Dcez6
         AyE/MReHd0UDyvsqQ1dcjbcHHGzQE45AL77maBpGefuUufFUjqFJhxNcYbvQrx8bU8Yu
         XLww==
X-Forwarded-Encrypted: i=1; AJvYcCWMOrdDCHjpKC9Azvkk4Rx+AfuUHha1Xqknkq9bsL8lNSVR5laR0I2gzY9L5vwWq/ja2Q7IoPNwJJxfrZ9z46Rttt+v8XKBMLWhN0auLg==
X-Gm-Message-State: AOJu0YzyZIlIYEK0P28WS0OQON8LGYDc0KYFzdCPk2ppI6Tmuj8ZSnb0
	Ry3t6/s8Vw+ai2JiMKvVhve0cL0Rdftcw9bUj8n3W1E1Y5s+zaBWzaLghMHKvYw=
X-Google-Smtp-Source: AGHT+IEkVOZCwYJCmSGDhPAUAkqnymtmKetJSKXO9qUKqm5sYxGpxVM8w+5mv9WV5/Fs8R8LNM+teQ==
X-Received: by 2002:a5d:638a:0:b0:35f:1d3c:4084 with SMTP id ffacd0b85a97d-3607a739a1emr5984501f8f.25.1718609668773;
        Mon, 17 Jun 2024 00:34:28 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750ad0b7sm11159542f8f.53.2024.06.17.00.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 00:34:28 -0700 (PDT)
Message-ID: <6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com>
Date: Mon, 17 Jun 2024 09:34:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mediatek:v6.10-next/dts64 53/53] Error:
 arch/arm64/boot/dts/mediatek/mt8188.dtsi:673.32-33 syntax error
To: kernel test robot <lkp@intel.com>, Nicolas Pitre <npitre@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <202406150109.433ozpQh-lkp@intel.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <202406150109.433ozpQh-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/24 19:48, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
> head:   2f950510411a33d98eea28c22d7880eeb48adb61
> commit: 2f950510411a33d98eea28c22d7880eeb48adb61 [53/53] arm64: dts: mediatek: mt8188: add default thermal zones
> config: arm64-randconfig-004-20240614 (https://download.01.org/0day-ci/archive/20240615/202406150109.433ozpQh-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150109.433ozpQh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406150109.433ozpQh-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/arm64/boot/dts/mediatek/mt8188.dtsi:673.32-33 syntax error
>     FATAL ERROR: Unable to parse input tree
>

This dt-binding patch has not been applied:
https://lore.kernel.org/all/20240603-mtk-thermal-mt818x-dtsi-v7-2-8c8e3c7a3643@baylibre.com/

This is why this error is raised.

Julien
