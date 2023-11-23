Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CD7BE58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 05:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajhItP5+"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3b842f16599so351041b6e.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 21:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700718812; x=1701323612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdUNABR6Mifi2m+aoepA5AMZHmcuu2ymDmdpy19JJlA=;
        b=ajhItP5+soOtLA54w04sX3DZTUMUg0sOuIik3bj6pzAaok/Lt5VPKCGTgDslcZpYme
         t8YSicWOoC0A4e+xRb2ovq+BOPBR6+Psve/osXwcC5L2OYfYHAdLmV+JRUf0qAZ0aLaj
         HcYj8fMA3DtJuuW9ZBs+KZG8mNAq4zVX+71O9U8gRjhrJ2Us8rx5MsTjDKxkS1IJINPy
         ACGmex+4+gMkct9sUc+kXNy4czwQOeZpnSFEzsxyNAIRhXUyJsayaYSGYRvhjr5Poih6
         ejMRV8mjPTJnJqdCCrwwRpuFwPNBCKAavJU6o4P7bH3Eyjpo7EeLXlapzuRKu17DycV9
         j+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700718812; x=1701323612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdUNABR6Mifi2m+aoepA5AMZHmcuu2ymDmdpy19JJlA=;
        b=C8zb6Og6C0NSk3q5gi/VdGfHY+csvkcBlNANR8HtihWCX88Io2CUPeWT8LNcealbKe
         mhlwpAOA/sVam/1z5LjNd4wyLeROBjJm83IsF3iHhSM7g4N/r7awbcfZ4wIx4fdK0CRm
         3OrI7nsvWyv9iNzv3sDE1pVCtqwxU3DYAee8BZZ6cG4poIZ45e6eXH6a4OEToTiKFGpV
         2ftspACv7h1EoS730NzVHD5FroKIYebpnsFPxqPw6odPffSIUl0ehFl3luMJCpRUCy3A
         JupTK/hTA7mc0UNtyYAoz4pZCnePcgxyrLvU2TEXOwjKBL1jBRgnF9PSb+5EU32Wl3yE
         GFRA==
X-Gm-Message-State: AOJu0YzM1S7uzitP03H/OKOh0gdbMGQlpH+vmgBRV2pLWmS+uiTC1MPG
	glvE445jecckPrJk4dR9TfA=
X-Google-Smtp-Source: AGHT+IGn7QzG9DaCsRCcjqAPRW3yKy2dFCdW/Gzty+AL0RBIV+vk1a4EV6ImJUUWF7zaet1wZozNgQ==
X-Received: by 2002:a05:6808:1915:b0:3b2:f275:18a8 with SMTP id bf21-20020a056808191500b003b2f27518a8mr6942617oib.22.1700718811822;
        Wed, 22 Nov 2023 21:53:31 -0800 (PST)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id u26-20020a62ed1a000000b006cbcd08ed56sm429438pfh.56.2023.11.22.21.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 21:53:31 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: lkp@intel.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	jlee@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	oe-kbuild-all@lists.linux.dev,
	onenowy@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: Re: [PATCH v2 2/2] platform/x86: acer-wmi: add fan speed monitoring for Predator PHN16-71
Date: Thu, 23 Nov 2023 14:53:23 +0900
Message-ID: <20231123055323.417287-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202311230750.psygl1ot-lkp@intel.com>
References: <202311230750.psygl1ot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is caused by dependency on hwmon. Setting both hwmon and acer-wmi as
module (or in-kernel) in config fixes this error.
