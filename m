Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A900C2E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 21:00:23 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-75ca95cd9b1so344667485a.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 03 Jun 2023 14:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685826023; x=1688418023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChwqNHO4n4dQaIkmbrYTAbuxsb0lC0FfWkWbJO6tejQ=;
        b=VeUQ8P9h6V2oQUzyNVd2Pu3Epb210rRaSp6gpHPVimQvYzgUESWQnd6MJG1ZJZETjf
         6kpE/Jpz5XiqUdCDnYS2XhoAspvjh2Kn/fZZtCqsN2aviyCE1kEEMDk5BKi8prG8zXvz
         5SMK1zCH6bxrDS0MaCAHB1mgs8eAWs5r0qSEwCl3qaaFlGuxPppaKbbnk0Xi9S72R4KC
         2ICrayGS5nzIrGUAxrElGxB5HxdavqsiXPsjafaiJihKJkurQyH6yFwV1plvUnlsCiXZ
         trUexfi9WnZYQBczTb4MhBUyawbwWFMS6fNSEfRGXS5dJGnxFiQyvcsHqcV4lcJpiWnA
         1KEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685826023; x=1688418023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChwqNHO4n4dQaIkmbrYTAbuxsb0lC0FfWkWbJO6tejQ=;
        b=cVQqRa7uYiJLBSPhV6MC4M8MGhkyisiJKjjzTCJWMOrRw+lSSDaqOGx6vmn9bdg+9U
         2kRMTDR9WIPuv6YuVakbiLUfHD2JU1AaRyxhstuxDZ3pVJB2nSoeQfgh88k6xCxCHhJu
         PDPzS7t6B26Ge8z0ZepO7cASZHoqL4POqqwSQyEZZ1dFie2vwkQk2r6BitSbBKHZff9y
         N4j8KJToDVGxK1uN1wkdwAXHQyIpOz5gjNVacxjO9000VMjjHrN24xurK52gXuh25okV
         +EwTIfJ5RGIi47DdMGC3x+Sz/fi8PKjIm21sUDFfbYlMUQKLnJluEOIdIfeXtODXxCsd
         2t8w==
X-Gm-Message-State: AC+VfDwYlvSWKNIDi/4/p+JaDBC+sityMoE/a+ImT+gxj33rlR3UNJ37
	8ysRuWnu6rcZ2LKJZOq//1WYRPsb6FekxyTk3NA=
X-Google-Smtp-Source: ACHHUZ6O6ocQPxrRPXRp56qxVt9JI6j/OmIasCsxVz7ZcWpqDycSCaZskg8m9gb0afNTySqEgIKd2BzUrcYw3LgVmmc=
X-Received: by 2002:a05:620a:4903:b0:75b:23a1:3651 with SMTP id
 ed3-20020a05620a490300b0075b23a13651mr18777415qkb.18.1685826022846; Sat, 03
 Jun 2023 14:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602072755.7314-1-jiasheng@iscas.ac.cn> <202306040153.RPAlkz3U-lkp@intel.com>
In-Reply-To: <202306040153.RPAlkz3U-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Jun 2023 23:59:46 +0300
Message-ID: <CAHp75Ve2sQ1i9tOAzOxuBmiA0G5djY6yXcQ_-P9ux6vnOr+DvQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: Add missing check for platform_get_irq
To: kernel test robot <lkp@intel.com>
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, oe-kbuild-all@lists.linux.dev, 
	linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 3, 2023 at 8:48=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Jiasheng,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on brgl/gpio/for-next]
> [also build test WARNING on linus/master v6.4-rc4 next-20230602]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jiasheng-Jiang/gpi=
o-sifive-Add-missing-check-for-platform_get_irq/20230602-152856
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> patch link:    https://lore.kernel.org/r/20230602072755.7314-1-jiasheng%4=
0iscas.ac.cn
> patch subject: [PATCH v2] gpio: sifive: Add missing check for platform_ge=
t_irq
> config: openrisc-randconfig-m041-20230531 (https://download.01.org/0day-c=
i/archive/20230604/202306040153.RPAlkz3U-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306040153.RPAlkz3U-lkp=
@intel.com/
>
> smatch warnings:
> drivers/gpio/gpio-sifive.c:226 sifive_gpio_probe() warn: unsigned 'chip->=
irq_number[i]' is never less than zero.

Nice!

...

>    224          for (i =3D 0; i < ngpio; i++) {
>    225                  chip->irq_number[i] =3D platform_get_irq(pdev, i)=
;
>  > 226                  if (chip->irq_number[i] < 0)
>    227                          return chip->irq_number[i];

So, this should be

  ret =3D ...
  if (ret < 0)
    return ret;
  irq_number =3D ret;

>    228          }


--=20
With Best Regards,
Andy Shevchenko
