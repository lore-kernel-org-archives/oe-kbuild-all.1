Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3273881D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Dec 2022 14:18:39 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id ud5so21817103ejc.4
        for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Dec 2022 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niYqII/y6uSXj/qldxCx5zx8OzKaw3GEXnxBhhCFXOg=;
        b=hmkFiOteIM1MtZAN0cHoQuZiqcnf1HUhX+/5XHKscPDBWysXzEx6yjvwkqCT5jnowM
         PvrPbwzBPvbHb7Duwq+31mlctE60unvh+AYNG3f9psbome+U3ET1tloSdSlEiwyYnv2M
         eC7i4E76F5XZmkmhDJKVPIXRTaEU7Q/03mc1TczUEmsPKcVn26T6Y+D7q+YYUnHp3qp4
         ofz3EBf2BUrbH/LYagShvQCAD5BvN4JGWdxOnQncvVhlQD6E8FiSK4UlkmN1kL9ZHsJh
         yZsAfCtZKNbfoZDOOCEoq8lN0iYr9/TuMRqaAb5mwycy+Hevr5HXQljrAghD4z+9iLdv
         8HzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niYqII/y6uSXj/qldxCx5zx8OzKaw3GEXnxBhhCFXOg=;
        b=nRfoyIcOK4pRPckUMK+ADZRY3raaxA+Vl8AEo1zN2eIGTW5HItUVHjaBVKYanMj8Ks
         b6GOnzsfNgUjCe3SgZ7yilXZGSJUMYOfhwNzB+0j4B9CxxiPkIjYAlvtuQS943J4N/uq
         utisGHFPKXmeOFSE6CW+YwOM+2eGQbMFC8ED1nznu5KSbS4Ai2ruwLlZmiM7ottErZFm
         WBpZ9wwm7VCI0J5vfECgNjDXTMQ3BVocf7wJHB/pjzY9x9QmVYRZTNapf194Z8cPXvBC
         haieR0KXJityFyfdo3wKbmHXt6e5dHNTfAnCzGQA3goVmr5ZApz9f44Y6veB71JE58Yz
         JeDw==
X-Gm-Message-State: AFqh2kpkz8IHQMKQqE8NTz6IWZJlWz1QXOqlzIUtXY0ZjPMtWbYYP7j/
	dpV5ZusRQOfpWXcl+J/28auxx3KdEnFp+/ovSAU=
X-Google-Smtp-Source: AMrXdXtx0tvpEG7FURZMaljXjcQr9ggA/FmU+9dgktRDtX7TywqZ9zxo1uoAB+x6Qs1o0qDiPIwXD+rEzpXuWs/rz4Y=
X-Received: by 2002:a17:906:3989:b0:7c1:1f28:afed with SMTP id
 h9-20020a170906398900b007c11f28afedmr1265191eje.678.1671977917920; Sun, 25
 Dec 2022 06:18:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212222251.Xacx8c4D-lkp@intel.com> <CAFBinCAB0VuoKKm4YHv_zB1d1xN3nP0=-xg9EotiWMJ_vikc2w@mail.gmail.com>
 <20221222234148.GA2776378@roeck-us.net>
In-Reply-To: <20221222234148.GA2776378@roeck-us.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Dec 2022 15:18:27 +0100
Message-ID: <CAFBinCCr=Q0796zK09=uY_bhBTR-xpKegT3i48psjZEpSjxkww@mail.gmail.com>
Subject: Re: drivers/hwmon/jc42.c:477 jc42_readable_reg() warn: always true
 condition '(reg >= 0) => (0-u32max >= 0)'
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Fri, Dec 23, 2022 at 12:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Dec 22, 2022 at 10:20:13PM +0100, Martin Blumenstingl wrote:
> > Hi Guenter et al.,
> >
> > On Thu, Dec 22, 2022 at 3:36 PM kernel test robot <lkp@intel.com> wrote:
> > [...]
> > >    475  static bool jc42_readable_reg(struct device *dev, unsigned int reg)
> > >    476  {
> > >  > 477          return (reg >= JC42_REG_CAP && reg <= JC42_REG_DEVICEID) ||
> > >    478                  reg == JC42_REG_SMBUS;
> > The bot is right: we can omit "reg >= JC42_REG_CAP" as it's already
> > covered by the fact that:
> > - the reg variable is unsigned, which means the lower limit is zero
> > - reg <= JC42_REG_DEVICEID covers the upper limit
> >
> > Before I send a patch I'd like to hear if removal of "reg >=
> > JC42_REG_CAP" makes sense to other people.
> >
>
> The bot keeps complaining about it. Yes, it is technically unnecessary,
> but I left it in on purpose to indicate that JC42_REG_CAP is the first
> register and that it wasn't forgotten. Any modern C compiler notices
> that the check is unnecessary and drops it, so there is no runtime penalty.
Thanks for your feedback. Since I had to double check the bot's
complaint I'll just keep this as-is (and not send any patch for this
at all).

> This is one of those situations where I'd like to have a means to tell
> the checker to please stop complaining.
I see, in some cases this may be an actual logic error (for example:
accidentally using an unsigned data type instead of a signed one).


Best regards,
Martin
