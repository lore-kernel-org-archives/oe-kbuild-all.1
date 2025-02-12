Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3620B803
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364575; cv=none; b=esnymP7yOP7MH7ZwzjJnRGB1bAMxiN8y3J5eDXqV+AzY8Z+x/QaMi8OeHYGXKEh2I/ZdIEAA6nY7G42fNvxmV/Qfo6yLMUp8juduXkuu87iflRvcIlHrC7Be8gbkrYUxLPkAedvRWRnR6PtwhEXCUXCsnYo/b8H+EJOn9nMIBgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364575; c=relaxed/simple;
	bh=VW6/4SSPyMS8p+Z4LCMrj3Xot8dO86al4y2tfmsilwE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aEINLaV0jB/ek3ABkZVu/SeTR2pW/6noVHWtHnaoSqOQYGNlyjHDc3Fakbgj4U4f58Nah+jQBZ/K5J9/c980WLVnciryZXxoDual1zaC3yZJk4pky9HCTeM7u4RhpTr2qQx5J1q59rAFhjQgz30iNW0tU7Ea03xwlItHBsrBJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb9L2qAj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb9L2qAj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1282843366b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 04:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739364572; x=1739969372; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW6/4SSPyMS8p+Z4LCMrj3Xot8dO86al4y2tfmsilwE=;
        b=nb9L2qAj0Llv0Ogv15wciLmbqt7c+SfhYmoKDBnT2UjSfu4PtPlULKGIacw8FAwgUI
         a7qyN98arhiQT65tCANUDA0sqeojaNybbc/OTQTEOWx/tcszxLn/6xBjViqqO1MgrNVg
         dYeTPPw/tU4BTA3iWz3ZZ2hMmmyUinRCBCFtedSBDHxSIAgblxBUevmPifZoIzm288d4
         RWU+BUwxvnZe40l0e7C6HzleFxHMHYlQlHUBpYKpjIS+x5QiLPEV2WxLPuVqhfyioa6U
         kBOgVq8sLZZ0XBDEaQYRZYjgPyrUeI4sVavqMTUSoMnuBF2KR7r+VIZ2toS/V75bHDP1
         0hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364572; x=1739969372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VW6/4SSPyMS8p+Z4LCMrj3Xot8dO86al4y2tfmsilwE=;
        b=XrpcwVhNZzxgWCHuEWRxy6dVhswWtE/E90SOvC59TAnZSXCTrF0XfCnkQfc9gP/xK5
         9FZBTIKqxYQBp7b6YqxYTjTwG4ZWv9hFf3eNlUGI/Rjcykx7kxJX/0CJOTwFa9WovrQb
         R7SR68+nxAlO7keu+S7rwxway928bE9+s0l2oAYaLffFuA6ZeP46VxSmAzynQfgzxTHq
         mvJw5FZXi2qwgErV/tGovmHCb7P7WjRJJlXTr4WP3SWrvUh4l3lKhTZd2ss/wuCljAPb
         fjgcR1fjZ4nmfSxa82F8UA7pAIES6wG5idrhwlQ9Dvm8VPmfvjjgbiOvVmpfAeFgsq98
         o0sw==
X-Gm-Message-State: AOJu0YwdhCcZGRt3pnrTN1n+zCokHn8QrtACKMe7UMFqdMvnSHlid9wv
	tUBxGbps8t5M8Zd1kpkUbSd2Kwe7FZQpgeLFA4Q14u23v7rQLTdD
X-Gm-Gg: ASbGncsLWkTpcuSSAkiyQx2b2SrE3NBkWa8BjcAVJG26kC1VLiRyGduWkevnjI3fKv5
	Po2Sm9qtUo66EcEfTZa0p0DRdJ5UFzqeXcTN6YY2EP8bKtcrznSP7x8hbQZCSVcoia8FrZcxfCj
	ZsoHGNGjrgPwmT/aXMU4m2Xj/U05vBg+KTZIsudRbE+I8gkwwaf63vJx5NzKpR06Y657tLCdBX+
	BuHuPDpflWqN8jvHGM5Cuoog2+wdpw8CgPwGxivRemQDx7RfV3gdXDgtlFQyp/AU0CmDAWvMy3F
	7REw0pkhxzsJpUlSZV9YyATOHQlcRvJS3SKjIqqOeg1ZKg==
X-Google-Smtp-Source: AGHT+IGciLXRAMb8IklxQt1qty8/NJhkxRO9Bik+gJhazg+83ZCzyCcKAnHH+OicOMzD4U/tmZgrIg==
X-Received: by 2002:a17:907:6d29:b0:aae:c3c1:1361 with SMTP id a640c23a62f3a-ab7f34a0d1fmr302302366b.44.1739364570890;
        Wed, 12 Feb 2025 04:49:30 -0800 (PST)
Received: from abityuts-desk1.ger.corp.intel.com ([134.191.196.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cd7ffaa8sm499724566b.132.2025.02.12.04.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 04:49:30 -0800 (PST)
Message-ID: <e1877881efdf56490650f564e9d218abd0673893.camel@gmail.com>
Subject: Re: [PATCH v3] intel_idle: introduce 'no_native' module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: David Arcari <darcari@redhat.com>, kernel test robot <lkp@intel.com>, 
	linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Jacob
 Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>, Prarit
 Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 12 Feb 2025 14:49:27 +0200
In-Reply-To: <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
References: <20250211132741.99944-1-darcari@redhat.com>
	 <202502121732.P7lZkbhm-lkp@intel.com>
	 <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
	 <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-02-12 at 07:41 -0500, David Arcari wrote:
> - #ifdef the code that doesn't compile
> - default no_acpi=3Dtrue in the !CONFIG_ACPI_PROCESSOR_CSTATE case
>=20
> I sort of like the second option better, but I worry about the=20
> documentation.=C2=A0 Specifically:

The most important part is build !CONFIG_ACPI_PROCESSOR_CSTATE, run and tes=
t
that it works.

Thanks!
