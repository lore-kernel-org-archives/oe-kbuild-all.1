Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4C23AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 21:20:26 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id d20so4720683edn.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Dec 2022 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9J0SAOJWmGg3K+OYwmd0BD0E3Ym8yEDir998iVg4B8=;
        b=hNgAdv6CJv+fGQM1pzmmqDVEAdsmQ3tjZltuJAd87S6ssz6ZUmn2LevZ7lQlhIuefz
         MNNugjW0FXa7H9YS/nUz1fWi9J7C4QQpUxBfPukCajzr4OpNMmS+rxIrZVjr+o7XsRo9
         5Z+iwkgEiHuTEASxV0sOAcP2iQAuHv45bFdsn/Nbmeh+tXfUmkZZRNkkESREC2mbB1WD
         XF/F5EXhQcb3B7G6wo30Uf7w15c4RYkUihg3UxPASgdBaDIfbiACQ3NOdgNAdL0Qcn/E
         yifDo9hiAHiofQLEHTff8tGQcJtrn/GNr8lNrsmwmUE8/7riIVUVYwPffQcyyB4cCgE6
         NCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9J0SAOJWmGg3K+OYwmd0BD0E3Ym8yEDir998iVg4B8=;
        b=ptJv49KgmjZrleeehhmoo/v68Njsj6fm3Mxu673KqPLCPVEKaLl2NXuJuIgOndCp86
         KMkTxI77itNjVpSTIzFa0Tm1nkvddFjaEeZU2nuXv8z8pckj/ZWvJNHCvlOundZEpF5v
         1WAez8lgp/ht0ypix18lBK3SxoxWU79i+loehikfKWbTfk8doVPl/KfPUhf3Lmkd822A
         ASgRoHozMPPXgBzlezR1f8G7sP5LpjV2mCPvjG5iudiCVK2Tws33DHY5jZg+RYAS9ZJb
         8hjcHkTNEUxAl07GHt0BkSH1pDTrlwIhlfQo79/fCxrACVb3CaNpWOb3SnKDK3NnKvbF
         qkiQ==
X-Gm-Message-State: AFqh2kolI6QjzgTIBOTDdwx8v1kihyMEKVBqz0XSv2ckUjpPm63GJ39i
	hKJ99BrT6avdwi3pyJHoXJPTQMq4A6kOTIrWOuA=
X-Google-Smtp-Source: AMrXdXueYdmjnNh5yZELCbKtKxe28suM1LRbcNb1OFiOLZtELR4RzoTx0nAysskex8TahO1zsxYVCAYPELpmaGm7FRk=
X-Received: by 2002:a50:ef0e:0:b0:46c:fa25:f03d with SMTP id
 m14-20020a50ef0e000000b0046cfa25f03dmr871442eds.291.1671744024348; Thu, 22
 Dec 2022 13:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212222251.Xacx8c4D-lkp@intel.com>
In-Reply-To: <202212222251.Xacx8c4D-lkp@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 22 Dec 2022 22:20:13 +0100
Message-ID: <CAFBinCAB0VuoKKm4YHv_zB1d1xN3nP0=-xg9EotiWMJ_vikc2w@mail.gmail.com>
Subject: Re: drivers/hwmon/jc42.c:477 jc42_readable_reg() warn: always true
 condition '(reg >= 0) => (0-u32max >= 0)'
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter et al.,

On Thu, Dec 22, 2022 at 3:36 PM kernel test robot <lkp@intel.com> wrote:
[...]
>    475  static bool jc42_readable_reg(struct device *dev, unsigned int reg)
>    476  {
>  > 477          return (reg >= JC42_REG_CAP && reg <= JC42_REG_DEVICEID) ||
>    478                  reg == JC42_REG_SMBUS;
The bot is right: we can omit "reg >= JC42_REG_CAP" as it's already
covered by the fact that:
- the reg variable is unsigned, which means the lower limit is zero
- reg <= JC42_REG_DEVICEID covers the upper limit

Before I send a patch I'd like to hear if removal of "reg >=
JC42_REG_CAP" makes sense to other people.


Best regards,
Martin
