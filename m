Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327733A9FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768928430; cv=none; b=hyc8iY4rWlquKtdf0CrWOh41/zT9+m4GxQEJ7vfmQqHliPog9YdDjbO2gNyDQjLOCuTodIRwtKdAHjCq/q3heyDngYuDPFzgwzqkax+mIWiRxS4iEU1pQCdhQn+vZgCE0KL9JTLXmpa1R2uHfxgl4PUE6iSx2mNxWcjcs67rp7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768928430; c=relaxed/simple;
	bh=dGPmdlD1ByZzGGMs6oFWpqJoVUn5SCztGkKA/zBhZIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITWBO3REMQKuW5TiB8J8TsAPj4NL0IRgzZIFjPut67pY9oU3H1IIyF7oqecJP4QpC0PwJOqThTAw3luT/qgmKB8I5Dwv/PEgjRM+qxeqBd5lyxLI3g0Da3Jwa3pBbszmEEsta8IYm/SSrB4Y48L5MrtOFVdfy98XXsfhlMiWO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOPf3Asu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOPf3Asu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so282612a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768928427; x=1769533227; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0aRv/yA3yTAemZZm90XPv2wmaFNTUa85/GgXDP9HUQ=;
        b=kOPf3Asu8XwLK9tr/tNcszcFfDv/ls3PR3X7JJm3WAR0ipyA8CnXPtc0t3pjRhqvTT
         JlhgIscOaSXFtzfmtS/dCdylrm4wwbZ/DGJNDnqQ9RbqtmzYHwLZTybmMdYJLMhX9fwq
         /4GUt1BJ0GAxi6QW/Gtxzrl1sXfXFeYyHaz1btaNtjUlaJAeHkKdSLVpgIYxfYqAmz7a
         bWMh08to+M9d1nusL/O0LIZdMxMYnqhUUK+/4ywgAvynO4fzgZZR2LBqiH0BDm8CRTL3
         /W5/ePHBLfnuQ6mE5140vx6b1N6n6SRJOD0FDbnFfn0jropKYIYfhQ59ujJlNiWfBSwa
         jPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768928427; x=1769533227;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0aRv/yA3yTAemZZm90XPv2wmaFNTUa85/GgXDP9HUQ=;
        b=KCT305K3GGJc0/kVDvUIJeVrA2YOSEeyz6GAOX8n6gbqSMYNuDIoI4lADugjtCO3OJ
         HO2XIAHyHLidZMoBBtw2uaj9QesDR+viajVIE1riaFmQcsetGnDPA0FspMo9/AGBGC/E
         xHqbqdkGXWP28mISl7rcBP5j9gAU32V9499JrsR9y1li+DWYYRrMGIP4W+AYinAHopK7
         LHaNKVsBCFVN1o/NIcadi+eePZL7TKYzleMJewOPSef25DmK4vGa7IYSp5l+v29KYkJw
         Mul2lKFIShFvhq+nHXuaO8c5aTzpkJef0l3uLhmFQltw464CbZRJlY9etg5hLmZkQ/J5
         Hpig==
X-Gm-Message-State: AOJu0YyYJvjaqjBGfnfeuhudsMQPiUPVYO4sGYP4IAv30mpYleRDrVrS
	nlR9iE7+VO6yh3Im9YHED4ulBT3J12wmYtpIXn0PNPkdk72RsmU46VfB
X-Gm-Gg: AZuq6aJgGWZLORtczKNCzm7xMYoQa/4vgDouIOD7DlTgcl8Bec0iu2lJs2F+svOYGdH
	p85jVcM7lqWVkGSw5r+axuE3XMKmvKalYbH7zvcvR9zfkXc1NpOzfPmjbU52ZuhgFvp5+Sm/gES
	fW8p9HfaupSM7WLNL3oiq5G/OMJky7arLa1uMFqJefGJdk3+SuleODZxvIcMJzOmlmW2M+aacAO
	qU1WDJRvtsZwmdPZemRlbOwpRPhNQ0ledzP+zmwCWuQ4y7sGwxprK/pLA7r9KyXa1r7Zk/hz122
	Sc/YC0P+FEt4+kZpONVsh3+S8WEoYkZJGefkpcu9cBNTNob/L7Lv4YHqyQrQVZRhLJ497E0+3ef
	1cYUBiweqFSNl/5ji5g9N4fbUTCXcEFT3aIRqj0gi79CBygbRkBzW/B3rdFM3qIySUyqZ3uLCxT
	dsNUMvOpvhj0+nE9aKrERDtAs4poAG5dEQep+9U1Fhx/nWPaI=
X-Received: by 2002:a17:907:6d06:b0:b73:3e15:a370 with SMTP id a640c23a62f3a-b8796bb87cfmr1365173266b.57.1768928426683;
        Tue, 20 Jan 2026 09:00:26 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e9f3sm1444991766b.10.2026.01.20.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:00:22 -0800 (PST)
Date: Tue, 20 Jan 2026 18:00:18 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Subject: Re: [mic:next 2/8] security/landlock/fs.c:1043:23: warning: variable
 'access_dom' set but not used
Message-ID: <20260120.6bba0085dd4d@gnoack.org>
References: <202601200900.wonk9M0m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202601200900.wonk9M0m-lkp@intel.com>

On Tue, Jan 20, 2026 at 09:38:50AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    security/landlock/fs.c: In function 'collect_domain_accesses':
> >> security/landlock/fs.c:1043:23: warning: variable 'access_dom' set but not used [-Wunused-but-set-variable]
>     1043 |         unsigned long access_dom;
>          |                       ^~~~~~~~~~

Thank you! I will address it in the next revision of the patch set.

–Günther
