Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF940EBB0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786100663; cv=pass; b=rRhDKHrjZnrQZzH4r4Vn8gT05LcDdUPpVkWMXvy8y2LgnNY8jA4WDXAh/ds3FrzvMBUbE9pk8BL0p8+rZWpy/3b3hpVkLmjzPjezZdCwlcye0O3gPlIpSXnIxNBs3CjAdxb2iD+LKrgfUOY2TZPQvEuovV8HWS45aHp+/fGU6Co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786100663; c=relaxed/simple;
	bh=Mq9+PVNWt/+na3H6D7b4kjk7D65ADp0RgMESxzP+hR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARyZRQ72opB/NQOHwQBdnL9awt9fGgHTjh4KGPUYy0XloJXfI0jvQMKmUfHxlboFfapxm2d7/SOQf8RTpQReq7FYvAymLK5WebGKG/vII+nszqr/7z0cvsf7K357z+r0uuF3TaoR3XOPxpgiYgXtoH4mgH9/pn9I6oRAGDL+Xks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eP8ugGUW; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eP8ugGUW"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51e4ba1cfb4so20489141cf.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Aug 2026 04:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786100660; cv=none;
        d=google.com; s=arc-20260327;
        b=n5F7KFlCD3IE/lhfhkR8Q7sP8R82QwRCixUHDxWoMm7i8/8G1kKnSWPrLqtunnIq70
         AwXHHsNPq6NOVx9aOw1BjHBV+iLZ0s/Q7rgFoc+bUMrAvyLl36xBqYnz5in7nnDJZSGM
         QCyL9Bazswba+ZHUXwUt/wULEWLdCJq5WgTbAAzqu9lrOG8313tjNOCcWcy0JKa75THY
         LKeaOlFgW/Yh5VzRAUcsC86fGntaBoOjPcyvgeGZKmo2fCxaXqrtZHjaay1rrt++vxs6
         3jc9pxl8j/niv8oxWFTJM+WTf0U6U1L4mGHPGPITzggNzuPn64jO/WbJfuvAPmH2Ulkj
         hVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyW2HpH/DdM5xgprQWFQavuhoygNcJG+sMU3tsOczNk=;
        fh=3wiHm4BGplB5fs765jL4TjWRU0UfK5iQVzUk5waqXlg=;
        b=IRB1UbSQJntSmQDS0UciLjEymcWw3asKQPy3/Ya3KxG7k1q8HpBb3rfkKH1oZRfkS0
         N+wO/ZisNmiHiFc7krWq8Cb67d9HJ9/3qKqGdMR2Yex1Jr6xxJIq7d4km1gA1QuyvmXd
         x1RCaoHQPqNxx7zUuIEj2hajvjKg69ONlU5MsLkdC1T4R+LY7aE4YGpeyGL6DoWSuUzk
         JI+ktooZOQEndK12boLkY4to9gsgOeFW15u7veEFZthK8QZrQ38+8XsYzckrhQszFyjI
         +lXvPb3V6kRLhfmqK5bPSqscbeuBwGtCXqV0CdgFtn7TizCFcKNIWoZw1Vsbp2He3yjX
         +1Cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786100660; x=1786705460; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyW2HpH/DdM5xgprQWFQavuhoygNcJG+sMU3tsOczNk=;
        b=eP8ugGUWHIxa1goSrMpgGef5p7GUQ7cPErJutAhh+cwQDpi97HLDJutBy9kEUbmTTr
         3jV+Zhz+Zgao/jTCLEz6KvWNo9dW2156PVqiXMO2pvznkCJnDpAlwq3odDmEmO5xH9la
         qKAVwnaLUwYpxIeRAPKR8cKQyWMxcDQCyKETQ6qdsruKcl7Bvnv2us9E9WxAfN89VMRg
         lveSaGKB0d3H5F1k/cyh5ueeqQAZIkjtK4bcB5sit0W9qTDgisLVcS/vC6z1y5IOGQl3
         fte31pbh/geyejm/lIA/n/cLxyNgAnl2fdSOFBLE5m9jlR+iZX5WYAHdXII4Vr3kn3WQ
         rFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786100660; x=1786705460;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyW2HpH/DdM5xgprQWFQavuhoygNcJG+sMU3tsOczNk=;
        b=EqKejp/804oTR252mH8RK+fmv7KqtIbWyHgj4umNw67/jHwkIKgRaHxlyY7VPMBdXJ
         TMgx9C+vT2oR73pOVEwbi0FVqxXv2wVNwX36L0egmDae5C/IGGljQSpWiNb+s9Z4fI2d
         C/zxPjy+4XMh+A8AfMnPZLyYIEEhI7ClTDE95cUbrRjiP6q9l9nnASdMVUYiwkGqmSFt
         /XQ6QUb7UEyUKISn+scfps/JHQvuYC2QPH1V41mhLKlUaphxDOEUgEFwjR7SVwg+hl6w
         XF6hzpCb9iKO2BGvck6xHtrzzTFq+2vZb/H8v/wLTb68w9Z/+gi2MzUwkkM5bq1axWyA
         7Tlg==
X-Forwarded-Encrypted: i=1; AHgh+RpRz64RXTa0qyCWUGliPE6veSpx0BiZkqcPGyVeER9vnSs5wNODNWnvfA1CyYPpm/l5nBYDF2QS3DqxwyFm@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1s89SdzVJrF5y9/sQ0SrAorwy/+PN4kDVVgT0fFZViP2ehieQ
	1hzywPDpLswtujGXeErDJ0tPANFnDRb6eI8HVbas050mDILnrfnABYZiaktFVPWhIF5SOjcUF4y
	gnBP3Ubz8Q5VgNtrMh6Y1GG7X1FrGeKY=
X-Gm-Gg: AR+sD11h4lefd77gi2LV7nH1MwpyqANUh0rYCo1nnX98Yk1D/t6KwLxP5ywtionjrRC
	OT8hDIxJmILr6/1fv7lpoRTACD0M+edJbD40Gdent575GbWT4oT1cpryQ4rEJaQqaBbxtkEYZpx
	230SoCFx8dx09yzHoZ+wlHvKPAykAe8DNTDDADOzlIBwAk48EgaICR95Ird4al1eTphvEp+4Tho
	eFvu0NTFcd8TfwcTYq2I7PgghrjdHHpcCwtT51v8UfCF8UkOpvLYOWC1Y/ketv/RALD7x5KPRrl
	iBswN/O4jYBxxhlhV1ev2QkaVKk1eS9qCVAZYXP5JBkAO2MjSMCVUcxWSPzkqRM4MlFPGLjWBCf
	7aEkv9uGutAGukjnwIRxrwOCm
X-Received: by 2002:a05:622a:349:b0:51a:8f3a:13b9 with SMTP id
 d75a77b69052e-52ce5ff26f6mr212757801cf.16.1786100660041; Fri, 07 Aug 2026
 04:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727094015.5101-1-liujiazi@amazon.com> <202608061759.sIcC6h4C-lkp@intel.com>
In-Reply-To: <202608061759.sIcC6h4C-lkp@intel.com>
From: Liu Jiazi <jiazi.liu1984@gmail.com>
Date: Fri, 7 Aug 2026 19:04:08 +0800
X-Gm-Features: AUfX_mwHqqQim5HcoeZF3oHWeAellpfuaxz6QwczLOHEkPer3vdbXBT3-1o9tOU
Message-ID: <CAAcjFgibrFJYKYp1Q-ig6hHE_WCg5KSSZV2Fvv0zawswEdHZEQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: gadget: fix IRQ storm on invalid event
 buffer count
To: kernel test robot <lkp@intel.com>
Cc: Thinh.Nguyen@synopsys.com, oe-kbuild-all@lists.linux.dev, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jiazi Liu <liujiazi@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Thinh.Nguyen@synopsys.com

Thanks for the review suggestions. I've updated the patch accordingly.
On thing I'd like to discuss: in dwc3_err_recovery_work(), after
soft_disconnect succeeds, should we attempt soft_connect to
recover the controller, or just leave it disconnected and let the
upper layer (e.g. function driver like ADB) handle reconnection
on its own?

In my testing, calling soft_connect after soft_disconnect triggers an
RCU stall. Simply doing soft_disconnect and notifying the
gadget driver via dwc3_disconnect_gadget_sleepable() is sufficient =E2=80=
=94
ADB recovers on its own after that.
What's your recommendation here?

Brs
Jiazi

kernel test robot <lkp@intel.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=886=E6=97=
=A5=E5=91=A8=E5=9B=9B 17:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jiazi,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on usb/usb-next usb/usb-linus linus/master v7.2-=
rc6 next-20260805]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jiazi-Liu/usb-dwc3=
-gadget-fix-IRQ-storm-on-invalid-event-buffer-count/20260806-005046
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> patch link:    https://lore.kernel.org/r/20260727094015.5101-1-liujiazi%4=
0amazon.com
> patch subject: [PATCH 1/1] usb: dwc3: gadget: fix IRQ storm on invalid ev=
ent buffer count
> config: i386-randconfig-r132-20260806 (https://download.01.org/0day-ci/ar=
chive/20260806/202608061759.sIcC6h4C-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260806/202608061759.sIcC6h4C-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608061759.sIcC6h4C-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/usb/dwc3/gadget.c:4681:32: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct dwc3 *dwc @@   =
  got void [noderef] __iomem *regs @@
>    drivers/usb/dwc3/gadget.c:4681:32: sparse:     expected struct dwc3 *d=
wc
>    drivers/usb/dwc3/gadget.c:4681:32: sparse:     got void [noderef] __io=
mem *regs
>
> vim +4681 drivers/usb/dwc3/gadget.c
>
>   4636
>   4637  static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer =
*evt)
>   4638  {
>   4639          struct dwc3 *dwc =3D evt->dwc;
>   4640          u32 amount;
>   4641          u32 count;
>   4642
>   4643          if (pm_runtime_suspended(dwc->dev)) {
>   4644                  dwc->pending_events =3D true;
>   4645                  /*
>   4646                   * Trigger runtime resume. The get() function wil=
l be balanced
>   4647                   * after processing the pending events in dwc3_pr=
ocess_pending
>   4648                   * events().
>   4649                   */
>   4650                  pm_runtime_get(dwc->dev);
>   4651                  disable_irq_nosync(dwc->irq_gadget);
>   4652                  return IRQ_HANDLED;
>   4653          }
>   4654
>   4655          /*
>   4656           * With PCIe legacy interrupt, test shows that top-half i=
rq handler can
>   4657           * be called again after HW interrupt deassertion. Check =
if bottom-half
>   4658           * irq event handler completes before caching new event t=
o prevent
>   4659           * losing events.
>   4660           */
>   4661          if (evt->flags & DWC3_EVENT_PENDING)
>   4662                  return IRQ_HANDLED;
>   4663
>   4664          count =3D dwc3_readl(dwc, DWC3_GEVNTCOUNT(0));
>   4665          count &=3D DWC3_GEVNTCOUNT_MASK;
>   4666          if (!count)
>   4667                  return IRQ_NONE;
>   4668
>   4669          if (count > evt->length) {
>   4670                  dev_err_ratelimited(dwc->dev, "invalid count(%u) =
> evt->length(%u)\n",
>   4671                          count, evt->length);
>   4672                  /*
>   4673                   * The DWC3 interrupt is level-triggered. Returni=
ng IRQ_NONE
>   4674                   * without clearing the IRQ source leaves the lin=
e asserted,
>   4675                   * causing a tight IRQ storm that triggers spurio=
us.c:184 BUG.
>   4676                   * Write the bogus count back to GEVNTCOUNT to cl=
ear the source,
>   4677                   * consistent with the stale event clearing in
>   4678                   * dwc3_event_buffers_setup(), then schedule a so=
ft disconnect
>   4679                   * to recover the controller state.
>   4680                   */
> > 4681                  dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), count)=
;
>   4682                  schedule_work(&dwc->softcon_work);
>   4683                  return IRQ_HANDLED;
>   4684          }
>   4685
>   4686          evt->count =3D count;
>   4687          evt->flags |=3D DWC3_EVENT_PENDING;
>   4688
>   4689          /* Mask interrupt */
>   4690          dwc3_writel(dwc, DWC3_GEVNTSIZ(0),
>   4691                      DWC3_GEVNTSIZ_INTMASK | DWC3_GEVNTSIZ_SIZE(ev=
t->length));
>   4692
>   4693          amount =3D min(count, evt->length - evt->lpos);
>   4694          memcpy(evt->cache + evt->lpos, evt->buf + evt->lpos, amou=
nt);
>   4695
>   4696          if (amount < count)
>   4697                  memcpy(evt->cache, evt->buf, count - amount);
>   4698
>   4699          dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), count);
>   4700
>   4701          return IRQ_WAKE_THREAD;
>   4702  }
>   4703
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
