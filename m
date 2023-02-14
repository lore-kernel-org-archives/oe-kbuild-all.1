Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0727721
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 17:22:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id mc25so4496423ejb.13
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXzOct/9awTTP6Vfra6idMPvdz9sciZM8UCJeQQTcOo=;
        b=KFdC1vzUNwP77kxIlaSFlFhX5/E7E4gn6poQBMs07GJKmG98m7LjUbwO7RZ2BD0Yma
         tYGfFg9NLGIDa0ojvHMhWgjkF7wF1J4M8/izkK9guwlGgEWnLXp4jfyhtWpV8+ia99j1
         ES1Yam62m1vzgmauTGbcO6WjiJ5HT9DMmJLBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXzOct/9awTTP6Vfra6idMPvdz9sciZM8UCJeQQTcOo=;
        b=sJws9n07/7TknSeg7dYF9fVts8LC1ryyLpBjyckWrX5x0fggsXvzhfTwZgceSVdmWY
         Q6Kk6bzkJqF4VsodKCelCCMcOTSuXU1Up1fIgF6UkU69dxbfSYc23pLsp6yvJZ3iFtaj
         YZ14DojNIp9S/5yAAcCYuNzE9VkZuKmBJjUyqWRMrSI9rmlePqwaKAHSuMIfZTsgbdOd
         wK+AVaN1tSlYFdpvP0If2Xb+AKIC2zPkKDm2j/cU3bLvVCuE6YZtXRPEEnfKYFkrJ3Uh
         Xm7XgmpUn2CovovDRm9thbA3aIu6BCQu6tOub8PeyJN8RE+yMr9krzn9EE/PnpQQ62wr
         r0ug==
X-Gm-Message-State: AO0yUKU6XL7Tzgf02uz35CEPfglcEHDoBOdvUeah12j9vxw91od/00tF
	nqq/dhqcCTEC0VO/dtIrMFExgYgTDS2M5u3EoPB7RQ==
X-Google-Smtp-Source: AK7set+pJ1AjyIDx0YVL8hLS/E81NKam1i082k+Kd046jktWo71h8P0tvxnWqM8XTx44vTMWYYk1i5XpJgn7BKrRNWw=
X-Received: by 2002:a17:906:6b91:b0:879:b98d:eb08 with SMTP id
 l17-20020a1709066b9100b00879b98deb08mr1616327ejr.3.1676395371586; Tue, 14 Feb
 2023 09:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230125-hid-unregister-leds-v3-2-0a52ac225e00@diag.uniroma1.it> <202302141039.anZLT940-lkp@intel.com>
In-Reply-To: <202302141039.anZLT940-lkp@intel.com>
From: Pietro Borrello <borrello@diag.uniroma1.it>
Date: Tue, 14 Feb 2023 18:22:40 +0100
Message-ID: <CAEih1qWcM1o5zgAt1oW+y6Xz828MMfmTHAVL-D-DeQXgnKTcOA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hanno Zulla <kontakt@hanno.de>, 
	Carlo Caione <carlo@endlessm.com>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>, 
	Roderick Colenbrander <roderick@gaikai.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Feb 2023 at 08:58, Dan Carpenter <error27@gmail.com> wrote:
>
> Hi Pietro,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Pietro-Borrello/HID-bigben-use-spinlock-to-safely-schedule-workers/20230210-080058
> base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
> patch link:    https://lore.kernel.org/r/20230125-hid-unregister-leds-v3-2-0a52ac225e00%40diag.uniroma1.it
> patch subject: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
> config: riscv-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230214/202302141039.anZLT940-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302141039.anZLT940-lkp@intel.com/
>
> smatch warnings:
> drivers/hid/hid-asus.c:532 asus_kbd_backlight_work() warn: sleeping in atomic context
>
> vim +532 drivers/hid/hid-asus.c
>
> af22a610bc3850 Carlo Caione    2017-04-06  521  static void asus_kbd_backlight_work(struct work_struct *work)
> af22a610bc3850 Carlo Caione    2017-04-06  522  {
> af22a610bc3850 Carlo Caione    2017-04-06  523          struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> af22a610bc3850 Carlo Caione    2017-04-06  524          u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> af22a610bc3850 Carlo Caione    2017-04-06  525          int ret;
> 31e578b641b3b3 Pietro Borrello 2023-02-09  526          unsigned long flags;
> af22a610bc3850 Carlo Caione    2017-04-06  527
> 31e578b641b3b3 Pietro Borrello 2023-02-09  528          spin_lock_irqsave(&led->lock, flags);
>                                                         ^^^^^^^^^^^^^^^^^
> Holding a spinlock.
>
> af22a610bc3850 Carlo Caione    2017-04-06  529
> af22a610bc3850 Carlo Caione    2017-04-06  530          buf[4] = led->brightness;
> af22a610bc3850 Carlo Caione    2017-04-06  531
> af22a610bc3850 Carlo Caione    2017-04-06 @532          ret = asus_kbd_set_report(led->hdev, buf, sizeof(buf));
>                                                               ^^^^^^^^^^^^^^^^^^^
> asus_kbd_set_report() does a GFP_KERNEL allocation.
>
>
> af22a610bc3850 Carlo Caione    2017-04-06  533          if (ret < 0)
> af22a610bc3850 Carlo Caione    2017-04-06  534                  hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> 31e578b641b3b3 Pietro Borrello 2023-02-09  535
> 31e578b641b3b3 Pietro Borrello 2023-02-09  536          spin_unlock_irqrestore(&led->lock, flags);
> af22a610bc3850 Carlo Caione    2017-04-06  537  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>

Hello,
Thank you, but the issue has already been fixed in v4.
Link: https://lore.kernel.org/lkml/20230125-hid-unregister-leds-v4-3-7860c5763c38@diag.uniroma1.it/T/#m8983ca3d0fbf656a40011a77c8988e3d16cac671

Best regards,
Pietro
