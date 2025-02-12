Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE7207667
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359941; cv=none; b=cfIOOPB8wk7y1ABhG7fHInz2xT8zlHhfLoF4FihJQRXjtxO+ySVzZ+UWqDAOJH+9qRguFItbj/bVaM9wv5W8F7K2W4OObFNHvfoeMW5CdWf9bVqzLg3HrICFNINusBlrwBwZeA02po59qiqPwkQNhCGDVJtdzTK16KY8vKu6RPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359941; c=relaxed/simple;
	bh=s7hHeLHxalaGcIL8rwFO9IhAesCKLsnoNKCUDby/PEc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CHs7rJcbTQyzc21NXWwYvPw1lWU+2WJbE6+aN6AsqglLN+ToJ+X6rxg8CF2Hk1F7/NoEVyPJSfPRSGQux4AcnCSDX4seargVosZpO5y7auCfCXpZTgJZncODp4hIdnCC/gShYMRjITc2k1FacDdTHuODohEtYETHT7WzZic8yJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNqZEXSH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNqZEXSH"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7b80326cdso615358066b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 03:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739359938; x=1739964738; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7hHeLHxalaGcIL8rwFO9IhAesCKLsnoNKCUDby/PEc=;
        b=MNqZEXSHpev18iUpma7zfXSMH+v/9q8TsfT4ZK34XOumUm1x7kKepszciTsHa/csg+
         yI/BWF+AVfuiJb07Ja3N1qMTV4XOTb1198LwTgfWQVhW5wXlPh/35Z10Mu6Uedcy3mkK
         VSLGH+9ncgE7H5zizxmRHvtkhlj6sR06+K/+c11Mhh/5q+Fr/bOTedgjt/V9T78H7+YG
         zrv9BL5UWjYOJ8HcyXXDDF0BOspE0a/peL+U5FTHorXbBMSIbqMFTbKVe3PdXfKZYQb8
         7Jh7TnNldX77iNPyC/L6hZFRco/WT812KYZWV9zJ/ISzEXkvaa3iLlpCEthIQodSIReN
         v5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739359938; x=1739964738;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7hHeLHxalaGcIL8rwFO9IhAesCKLsnoNKCUDby/PEc=;
        b=PI+SfGYXZ7s8ESmgVtHJRvQt3v67ZpvReXz/FE6CvSFhFVF1nXa3G2Z38DBiy02p47
         wbS7aDAZCpVH+G19gA7FYYyfplzvbI69xYFdMWKaBLoc4axAGETGGmnoTPE9RKBc0fzY
         CDZ3l2249zIiZAjr/46glY0yjZXwVWfizxOXG53lK3zTdq07zulH78yBHrWzwPtPAJ7l
         Rw2RUymRF6kiJ6VZLK7e2NzAVP5naa3bk0E5u1Z31eNUEjwSvzaegr/9aH7RFKN9J/k9
         OWsHzJSDqv31Y2QkRBOvBZxB6eD59UWox0GguJbzpTAo1TWJKEQMeSiFZIiOXKjOKpel
         HucA==
X-Gm-Message-State: AOJu0YzDvfIGjKvfd/x6o0ZGaGjn8jK/pNyQjCGcsibUGi2o8HSinrfu
	IFEmIEFjJUeUofo9WtgjLXGEPxA3h+0UYhbWCijnoKyj5JvZq7TM
X-Gm-Gg: ASbGncu1AEzSm+ipkHcTEt13bpunBJSXXL3RSDbkKTf1aToGCW4EvQtiaSe+/NBkW5c
	6zh1rN+IQNJVuyR7VlOCHGFSbrOVR2azX3BwlqSnqv7mHNyts7jXmoygVFVkIkujqGeRrVTf2zM
	GY1q/JQF7sAXGgQCwNFi33CQO7ClNEA9JNBvw4xLCZU0tYi0++/fSPIAt19yqn2TRdDKTRFlc6k
	qIKwZcK7dhq0IrH5lVF/dEAcJ8cMyGrHAkiul5FdaZtmCccmYbwVn56LtIKqht3/4tiAw1K1E3v
	dCG0RXqpnYvbEs195Pi52ajUPFm+xlxZv7am/gRBRq1vAA==
X-Google-Smtp-Source: AGHT+IGJJXndp5jBgYdH0F5LQVt/q3VMN6qyAAnLNn0OT4b42ec2KYia/IvE9C8PTwq0Y5hlfFGx6w==
X-Received: by 2002:a17:907:d8b:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab7f34da843mr200509566b.56.1739359938215;
        Wed, 12 Feb 2025 03:32:18 -0800 (PST)
Received: from abityuts-desk1.ger.corp.intel.com ([134.191.196.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bcd53bf5sm629950366b.87.2025.02.12.03.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:32:17 -0800 (PST)
Message-ID: <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
Subject: Re: [PATCH v3] intel_idle: introduce 'no_native' module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: kernel test robot <lkp@intel.com>, David Arcari <darcari@redhat.com>, 
	linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Jacob
 Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>, Prarit
 Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 12 Feb 2025 13:32:14 +0200
In-Reply-To: <202502121732.P7lZkbhm-lkp@intel.com>
References: <20250211132741.99944-1-darcari@redhat.com>
	 <202502121732.P7lZkbhm-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

T24gV2VkLCAyMDI1LTAyLTEyIGF0IDE4OjA5ICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90
ZToKPiDCoMKgIGRyaXZlcnMvaWRsZS9pbnRlbF9pZGxlLmM6IEluIGZ1bmN0aW9uICdpbnRlbF9p
ZGxlX2luaXQnOgo+ID4gPiBkcml2ZXJzL2lkbGUvaW50ZWxfaWRsZS5jOjIyODk6Mjc6IGVycm9y
OiAnbm9fYWNwaScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlCj4gPiA+IGluIHRoaXMgZnVuY3Rpb24p
OyBkaWQgeW91IG1lYW4gJ25vX2FjdGlvbic/Cj4gwqDCoMKgIDIyODkgfMKgwqDCoMKgwqDCoMKg
wqAgaWYgKG5vX25hdGl2ZSAmJiAhbm9fYWNwaSkgewo+IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fgo+
IMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbm9fYWN0aW9uCj4gwqDCoCBkcml2ZXJzL2lkbGUvaW50ZWxfaWRsZS5j
OjIyODk6Mjc6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzCj4gcmVwb3J0ZWQg
b25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KCkRhdmlkLCB0aGlzIG11
c3QgYmUgdGhlICFDT05GSUdfQUNQSV9QUk9DRVNTT1JfQ1NUQVRFIGNhc2UuCgpUaGFua3MhCg==

