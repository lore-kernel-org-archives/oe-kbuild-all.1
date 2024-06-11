Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9278D749C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 02:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718071668; cv=none; b=bctrV6oN5ZPStmneKCeeXWdaiHhbf3qj/AqqyHasZE33BtbDeY/tdlR7hhfY6eaegFEoSiI4/B6ud5yk1gKF0ok0CWWzYguNrPNjSOdD7oWUMRFryvRMW4cq96JQfnf2zsBnUYtFbHWT9PWGWVHpMMZTggm1+L9dDohnkM552Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718071668; c=relaxed/simple;
	bh=t+FQJsYag++4WO2qxLXgPpQ0EMcj6jfCuoNIA7zG5a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sho0n4QNIgpcUqwcL5a0fpN1zmVNT3eK0AJxYf3cm5hSeaodlpv5lrPHSpAWYReqTgyKAEnzUZ3ileiWzLyoprFlP0XKeF9FUS6LlhgooY0LoKZ5DIA1cl19lhEZzBuhvL4Kx/HtYgLYrzzBpHGdososLRw+FHADvT7oBDFvK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRWrh6tA; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRWrh6tA"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b52b0d0dfeso2568892eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 19:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718071665; x=1718676465; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7K602fz4gBHUWwZgz6PtHdWhG4F3fJUQgT9uMqHP2k=;
        b=lRWrh6tAc7ueL9dpHJPEi9+Z948j5zRCSeEAkX8bI0944PS3NosqxtQWfTUm0Jsk7m
         ynUGAB/0LUVojLijgUwQgef1oF5K6Apxiq3P3Y595aQXTW2tCReoIWyf418sQ/bXCitr
         rQ7et1F71bl2uriBEPmsAgId86jE1Vyp9e6ZCzjXq3GPc2dhL7zqpjVYIKPxVv8FhmHn
         XPL95rcbxf5UwqqR1iN1dciXYGrCQLO2Ev/0c1OEnhMlafCeOpvwEYd4zFI4XaLdFq1P
         wfUzicFJCEt4kqV6irOXwt09j2IS8w+N1iD+0phmRjPUnwHB1j+ToUEEU/hlu0V0Gsc7
         mtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718071665; x=1718676465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7K602fz4gBHUWwZgz6PtHdWhG4F3fJUQgT9uMqHP2k=;
        b=LTkML5XzSoSRSA/CW41DMV7SB4d8Yvo2U9jHqFP5eO55s3YfX2sLHP+yWH1+ouGNDD
         HcqWKBh9G3M29x/U5Vb3d+VBcPe64nt4S7v+yD7w26VgZhWiHqwmq0Fnfw9lII7kiZ76
         jBh14NiopF+H/pcRWNDUdPSl1jn3jk+hvjEAiExBfN+Pgtr1izBcDD3qWHPvQ3AKt4Ta
         /gP8BR9diMtb96ZhXoQaEZY5IDjBNep+UkNQ5bfXbTRzIMdFvMEpOdknXUknIZZDjImL
         1xhnHqptomOuNobgjuJ4unZaBx8uRin6ZBLL+zq2HXwmsOIDpYjqOYOwMv4abMkT7zO8
         myMg==
X-Forwarded-Encrypted: i=1; AJvYcCXuHqtUJDxb3hjyGaAf8rbu9QlKfVV6GD0mA64Dlyjs5GgJZ2m7C/us5To/jTIwfcpscOK6KnFPW4uIUg2ldPJC6DK/Nd5FbZKLTrpAhw==
X-Gm-Message-State: AOJu0Yxg7IJh9rBmjB47m3RCUNl9Vf5qLJ4JWzRqInkEotwSQ2278UXi
	G1DDp+ar32zb+4xz8mpHCmu2Gh5RWnZ++grmZdOsbhVDbeOe9wK4fb1Ls2PcLM+cptz5svXnRKv
	DIKRJClUYiqoKElZBrhBvXJNoAq4=
X-Google-Smtp-Source: AGHT+IF5NJP+cpN1QZ14dVDvRLKhqj/JIMm3OyP45URA0uC4Hs/4MNcrZV5+u6AtOEjVEtzm+FJweysb15RclHZy/3E=
X-Received: by 2002:a05:6820:1c9f:b0:5ba:e5c3:4fa6 with SMTP id
 006d021491bc7-5bae5c35072mr6628691eaf.6.1718071665549; Mon, 10 Jun 2024
 19:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240610003520.33839-1-dzm91@hust.edu.cn> <202406100911.QBMVtIpz-lkp@intel.com>
In-Reply-To: <202406100911.QBMVtIpz-lkp@intel.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 11 Jun 2024 10:07:19 +0800
Message-ID: <CAD-N9QXgU7_iCLmH5z0e78ydCkwgWiz2Mti6zDqQp9jnExiVAw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: update the translation of security-bugs
To: kernel test robot <lkp@intel.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 10:07=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Dongliang,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on lwn/docs-next]
> [also build test WARNING on linus/master v6.10-rc3 next-20240607]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dongliang-Mu/docs-=
zh_CN-update-the-translation-of-security-bugs/20240610-083729
> base:   git://git.lwn.net/linux.git docs-next
> patch link:    https://lore.kernel.org/r/20240610003520.33839-1-dzm91%40h=
ust.edu.cn
> patch subject: [PATCH v2] docs/zh_CN: update the translation of security-=
bugs
> reproduce: (https://download.01.org/0day-ci/archive/20240610/202406100911=
.QBMVtIpz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406100911.QBMVtIpz-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../=
../networking/netlink_spec/rt_link>`
>    Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../ne=
tworking/netlink_spec/tc>`
>    Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../ne=
tworking/netlink_spec/tc>`
>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt ref=
erences a file that doesn't exist: Documentation/devicetree/bindings/input/=
qcom,pm8xxx-keypad.txt
>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm57=
03-regulator.yaml references a file that doesn't exist: Documentation/devic=
etree/bindings/mfd/siliconmitus,sm5703.yaml
> >> Warning: Documentation/translations/zh_TW/admin-guide/reporting-issues=
.rst references a file that doesn't exist: Documentation/translations/zh_CN=
/admin-guide/security-bugs.rst
> >> Warning: Documentation/translations/zh_TW/admin-guide/reporting-issues=
.rst references a file that doesn't exist: Documentation/translations/zh_CN=
/admin-guide/security-bugs.rst
> >> Warning: Documentation/translations/zh_TW/process/submitting-patches.r=
st references a file that doesn't exist: Documentation/translations/zh_CN/a=
dmin-guide/security-bugs.rst

Thanks for the report. I've sent a v3 patch with this issue fixed.

>    Warning: Documentation/userspace-api/netlink/index.rst references a fi=
le that doesn't exist: Documentation/networking/netlink_spec/index.rst
>    Warning: Documentation/userspace-api/netlink/specs.rst references a fi=
le that doesn't exist: Documentation/networking/netlink_spec/index.rst
>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/reserved-memory/qcom
>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/display/exynos/
>    Using alabaster theme
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
