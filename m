Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A323EA83
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792242772; cv=none; b=heUjEZfK1H2Kr8ZuWtWoQZ8LULgPSmnQ0ow0v+mt38CQL57dvZKhmrACbn2K6N5+FCJpiUHGI9MRbotLAKqkXnIo0lx85Bcrrc+xzDClHl7hP9qk8LT45I6f9WBvZm8Iss8BDlPfAInXS+BozEQhYfB+Uvf62SoV3CGN3bsPoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792242772; c=relaxed/simple;
	bh=b2DbzjEv1ycRQ4BtIbfzVMb7og/98ShD10DRQlMt6tU=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=m4vYnPtrBTNZcKOzV2qgsxSPx8nIkqYc0FunOlqSR+sUOjqmPu0Cca4ADImCSqs4D0IDw8o/eBa3uGOlpx0pKb1VimytUtkDKWX/qTjPtpCsoMw7+8T21eyuDoqqxeMvtCuJQRViqUgnC9CwRfoWf9W4MqgM6gFj32ChZTMz1Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6jUAOkx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6jUAOkx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so10395045e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 06:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792242769; x=1792847569; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:in-reply-to:references:from:subject:cc:to:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vVJoU2SfFWooil8mYswD7FtsdjdV0OLch5TOCYNKlq8=;
        b=Q6jUAOkxqSGkFX4TdIaa+8+aggCzOQCiRSzKm2MAbjfn6+MZG7ReFV33BSuEJkBwG0
         xmBRyUkpjfYfIVymaslQgNLMGHOlTj7DO1q7iqqtn9fo8qEtOkefP/Ykeh/OSTwvRkSt
         tHvCLiurq6MedTXkNLhAcrYYGfrT5tL2eYFOSONnnwBy9KvfE8pad5JrZmvKaeiUw9JU
         BFZFs0GmKsl2n29IvVD7SvkxNXK4WwprenW2+RkwnY+4kP01d1Ti/BMLAWzv+WBPvEtc
         IgpUtwK7d1LIt2qSZuLnVK+O242kZ8CUg5D829u+AUcm+CdNk0p8wYNa1EYfIblhK2G/
         nehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792242769; x=1792847569;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVJoU2SfFWooil8mYswD7FtsdjdV0OLch5TOCYNKlq8=;
        b=XF19l9CXCZdH5Fz8GvVh6wJOE8a0orkT0va4Mw3Kr1vFdOhml6ys114ZBVkiE0rQdn
         CX2FOf4e5RRFEd6NoaRjDrvHvzXl1rdfRxYHGsRL4h23mZDo5qPy/Z69xj03/KUIPxB2
         yzyfGKCJfubVuOs1f9Tywoe5oyLGVAFZ0e7Hx2T0mZzi78S1YoToEvDN56lNzbysLFXS
         OGkO7KqTkYv+jf8sib2G2B587f1Uov0NCyJnKlxbjsJxIuXOZOtKQRLjnbimA6qp5MYG
         xpJ0c7/PF+lRzucngTXkheZzG88muZxBEKKoNs83+zRC5NO7vdaSJL5/iIUjLsSy7UT/
         mswQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU7c8Qz0XpBU66cwdb+y1WxHAwFisKR1lUloGkauLyOOyuQUr0P2RmYPHvp1Eml2zx79C1KqmE0qCQbWkT@lists.linux.dev
X-Gm-Message-State: AFq9FYK5jkebYUHz7PTHeqOn6PGNV2d3d0NvFdp6v/+g6bLKenlWqzNd
	fY467ojG+1opKFJER0u7CQLsxSAQrPkK0wdwxJuZldDT4n/q2z/yDlDb
X-Gm-Gg: AYBFou2rU95WnKUXC0Edn/2i29xoAAqAIzIhZqh6cIHB1YpB92pUu3iV2HzBaKVpGKP
	tz8QNwxqsdkfnttCpU5M0isk+AL3IZGB4paM0/4vEpFtOGDh9IKgI2dHQCKvwrvrxNptaAe4CwG
	rSV8GN3REvl90JLweqwP7ZZzkCPPvuxIfA0LlXh09uFiM08FfQkyx/mEQUQ1J29WBIe2fdTuYV1
	mbMxQ7Ad4H12Qme6Mo3R8SbeIhaJFvaYhg1CONvt9rP+yUDXWUMM6Im/HeuSnCgvAFQ+90LXYHp
	ly8Rm4wt2EKbZTPdqSdAPXg9h/0yRwhxUcbgMF3/m2F5t4Rtc8faSuXVLscnpOe8Sfklx2mnV01
	Nm93lmlH3oWbAldsJNAadxQyt9Y+qAsIvXFflNUUx9LuKwVaY5qWkNIWGXc9124OE9pOQMd1z9P
	x3sTvkKTpoo81RA9d56ZkPhZexKEvO7D2+prOsEVgIXT8C4EzCp5zfjlP0oClwtk2RRDl417NWV
	FGVENr99pkh
X-Received: by 2002:a05:600c:1389:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1d76074c6mr57411265e9.6.1792242768851;
        Sat, 17 Oct 2026 06:12:48 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm256948975e9.10.2026.10.17.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:12:48 -0700 (PDT)
Date: Sat, 17 Oct 2026 15:12:47 +0200
To: kernel test robot <lkp@intel.com>
Cc: Vicki Pfau <vi@endrift.com>, oe-kbuild-all@lists.linux.dev,
 linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: [hid:for-7.4/nintendo 2/5]
 drivers/hid/hid-nintendo.c:3993:undefined reference to `hid_is_usb'
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <202610171559.gZ0QBMFv-lkp@intel.com>
In-Reply-To: <202610171559.gZ0QBMFv-lkp@intel.com>
Message-Id: <3HN3VLNWTGRM8.2HVANQO7V2MPM@homearch.localdomain>
User-Agent: mblaze/1.4-3-ga04b747 (2026-07-03)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Heyhey!

kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7=
.4/nintendo
> head:   77c7155e2707ba5b1d56f3dc1acead48cf17f98d
> commit: 9417132df63e5cd7230433af05198538e759f3ae [2/5] HID: nintendo: Add=
 preliminary Switch 2 controller driver
> config: i386-randconfig-1001-20261016 (https://download.01.org/0day-ci/ar=
chive/20261017/202610171559.gZ0QBMFv-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261017/202610171559.gZ0QBMFv-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610171559.gZ0QBMFv-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    ld: drivers/hid/hid-nintendo.o: in function `switch2_probe':
> >> drivers/hid/hid-nintendo.c:3993:(.text+0x6cd7): undefined reference to=
 `hid_is_usb'

I might be doing something wrong but I have checked out "for-7.4/nintendo"
from the https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
remote and my build finished without errors ...

So I'm not able to reproduce this issue locally.

Cheers,
Silvan


>=20
>=20
> vim +3993 drivers/hid/hid-nintendo.c
>=20
>   3985=09
>   3986	static int switch2_probe(struct hid_device *hdev, const struct hid=
_device_id *id)
>   3987	{
>   3988		struct switch2_controller *ns2;
>   3989		struct usb_device *udev;
>   3990		char phys[64];
>   3991		int ret;
>   3992=09
> > 3993		if (!hid_is_usb(hdev))
>   3994			return -ENODEV;
>   3995=09
>   3996		udev =3D hid_to_usb_dev(hdev);
>   3997		if (usb_make_path(udev, phys, sizeof(phys)) < 0)
>   3998			return -EINVAL;
>   3999=09
>   4000		ret =3D hid_parse(hdev);
>   4001		if (ret) {
>   4002			hid_err(hdev, "parse failed %d\n", ret);
>   4003			return ret;
>   4004		}
>   4005=09
>   4006		ns2 =3D switch2_get_controller(phys);
>   4007		if (IS_ERR(ns2))
>   4008			return PTR_ERR(ns2);
>   4009=09
>   4010		mutex_lock(&ns2->lock);
>   4011		if (ns2->hdev) {
>   4012			mutex_unlock(&ns2->lock);
>   4013			hid_err(hdev,
>   4014				"Second hdev tried to claim same controller, first=3D%p vs seco=
nd=3D%p\n",
>   4015				ns2->hdev, hdev);
>   4016			kref_put(&ns2->refcount, switch2_kref_put);
>   4017			return -EBUSY;
>   4018		}
>   4019		ns2->hdev =3D hdev;
>   4020		hid_set_drvdata(hdev, ns2);
>   4021=09
>   4022		switch (hdev->product | (hdev->vendor << 16)) {
>   4023		default:
>   4024			strscpy(ns2->name, hdev->name, sizeof(ns2->name));
>   4025			break;
>   4026		/* Some controllers have slightly wrong names so we override them=
 */
>   4027		case USB_DEVICE_ID_NINTENDO_NS2_JOYCONR | (USB_VENDOR_ID_NINTENDO=
 << 16):
>   4028			/* Missing the "2" in the name */
>   4029			strscpy(ns2->name, "Nintendo Joy-Con 2 (R)", sizeof(ns2->name));=

>   4030			break;
>   4031		case USB_DEVICE_ID_NINTENDO_NS2_GCCON | (USB_VENDOR_ID_NINTENDO <=
< 16):
>   4032			/* Has "Nintendo" in the name twice */
>   4033			strscpy(ns2->name, "Nintendo GameCube Controller", sizeof(ns2->n=
ame));
>   4034			break;
>   4035		}
>   4036=09
>   4037		ns2->player_id =3D U32_MAX;
>   4038		ret =3D ida_alloc(&nintendo_player_id_allocator, GFP_KERNEL);
>   4039		if (ret < 0)
>   4040			hid_warn(hdev, "Failed to allocate player ID, skipping; ret=3D%d=
\n", ret);
>   4041		else
>   4042			ns2->player_id =3D ret;
>   4043=09
>   4044		ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
>   4045		if (ret) {
>   4046			hid_err(hdev, "hw_start failed %d\n", ret);
>   4047			goto err_cleanup;
>   4048		}
>   4049=09
>   4050		ret =3D hid_hw_open(hdev);
>   4051		if (ret) {
>   4052			hid_err(hdev, "hw_open failed %d\n", ret);
>   4053			goto err_stop;
>   4054		}
>   4055=09
>   4056		ret =3D 0;
>   4057		if (ns2->cfg)
>   4058			ret =3D switch2_init_controller(ns2);
>   4059=09
>   4060		if (!ret) {
>   4061			mutex_unlock(&ns2->lock);
>   4062			return 0;
>   4063		}
>   4064=09
>   4065		hid_hw_close(hdev);
>   4066	err_stop:
>   4067		hid_hw_stop(hdev);
>   4068	err_cleanup:
>   4069		ida_free(&nintendo_player_id_allocator, ns2->player_id);
>   4070		ns2->hdev =3D NULL;
>   4071		mutex_unlock(&ns2->lock);
>   4072		switch2_controller_put(ns2);
>   4073		kref_put(&ns2->refcount, switch2_kref_put);
>   4074=09
>   4075		return ret;
>   4076	}
>   4077=09
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


