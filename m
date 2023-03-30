Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1301C3E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680174738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oYqpg+uZa6tgjrnBGs2tsZwqEVLA3EFw2OD8bhme+dA=;
	b=BrBpizUyonNeEhyICiSSg2huuqD9uFEg18Z0uTO90G8wfDWB51ZlDH8Qg/3zgG1eoW9ip9
	pqyEqVcrBZQj/d0TUSdRAUV/234eYZrm3ebsGj4sC50LCc/pnxjxAT79Bse2K3Z4mBr6a2
	JvAwubixSHlsPgRM8+9Al3Nc8MUFbpw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-bi5pYMSGPNKV85wEAn9G7g-1; Thu, 30 Mar 2023 07:12:14 -0400
X-MC-Unique: bi5pYMSGPNKV85wEAn9G7g-1
Received: by mail-wr1-f71.google.com with SMTP id b9-20020a05600018a900b002cfe70737d2so1910684wri.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 04:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680174734;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYqpg+uZa6tgjrnBGs2tsZwqEVLA3EFw2OD8bhme+dA=;
        b=FbuIPIUvv4ZoVsnEL8DAh61++1DA4nVSaQ/Muhrqz5xx7FJoe2xd3l5JgAOco+YDl8
         iYWIozJSbkdPvxii1l5SZrYdx4+i+CmasSSScanlSYmgH3htNgaWdzJwJdnG+c/okrZL
         5DjlBNTpO1Po5VJtpAFpm826j/u2xUHiwf6dUrpkDxJEz6CRKQf62fE0suFx6QOP9deX
         +8qQU57HXdqdzrzSBXY+lQhMs8UN4LjSwma9yJubEeei1IKZK6IdWf9E1HKOU4UqEvD5
         jyjwQ5ntz2uTsZRe1eLjyKJdAWGwtpawNBnQIDuc0BX1V6l9PgkrYlLyvjRmvJvwcWqA
         qw9w==
X-Gm-Message-State: AAQBX9daeYeLA7idRZXjSVldWw1wWaQDa3isJBR/TJywSehlw7lVVZ/K
	WRRYYHKsdhHU5NyqwN005xIcAfc1yG8qkOtdwvl6iNDTz7Bl01QoIeuYkbP5aUOQzVsbETLhlvZ
	NOB4opu6/JgubuiDoXFICiM0E4g==
X-Received: by 2002:adf:f4c7:0:b0:2ce:ac70:5113 with SMTP id h7-20020adff4c7000000b002ceac705113mr17557468wrp.41.1680174733788;
        Thu, 30 Mar 2023 04:12:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnsNEVnBMYqDKqOs+BLR/fboYCbIFeK4GxvvvH5EDwj1dlpauKlszJEHQWcs591307lwwQdA==
X-Received: by 2002:adf:f4c7:0:b0:2ce:ac70:5113 with SMTP id h7-20020adff4c7000000b002ceac705113mr17557441wrp.41.1680174733432;
        Thu, 30 Mar 2023 04:12:13 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe585000000b002cea9d931e6sm32767201wrm.78.2023.03.30.04.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 04:12:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Enric Balletbo i Serra
 <eballetbo@redhat.com>, Brendan Higgins <brendanhiggins@google.com>,
 linux-kselftest@vger.kernel.org, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>, David
 Gow <davidgow@google.com>, Daniel Latypov <dlatypov@google.com>,
 kunit-dev@googlegroups.com, Maxime Ripard <maxime@cerno.tech>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: Add KUnit tests for some of the input core
 helper functions
In-Reply-To: <202303301815.kRKFM3NH-lkp@intel.com>
References: <20230330081831.2291351-1-javierm@redhat.com>
 <202303301815.kRKFM3NH-lkp@intel.com>
Date: Thu, 30 Mar 2023 13:12:12 +0200
Message-ID: <87a5zufq7n.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

Hello,

[...]

>
> All warnings (new ones prefixed by >>):
>
>    drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore files
>    drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .gitignore files
>    drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of the .gitignore files
>    drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore files
>>> drivers/input/tests/.kunitconfig: warning: ignored by one of the .gitignore files

KUnit folks, what should we do about this? I believe the correct thing
here would be for these dot-files to not be ignored by git.

Not only to prevent these reports, but also to avoid the need to add
them using `git add -f`, since is quite error prone and easy to miss.

I was thinking about posting the following patch:

From f1dc1733001682886458c23b676123635bc29da0 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 30 Mar 2023 13:04:42 +0200
Subject: [PATCH] .gitignore: Exclude KUnit config dot-files

There's a rule to ignore all the dot-files (.*) but we want to exclude the
config files used by KUnit (.kunitconfig) since those are usually added to
allow executing test suites without having to enable custom config options.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 70ec6037fa7a..7f86e0837909 100644
--- a/.gitignore
+++ b/.gitignore
@@ -103,6 +103,7 @@ modules.order
 !.get_maintainer.ignore
 !.gitattributes
 !.gitignore
+!.kunitconfig
 !.mailmap
 !.rustfmt.toml
 

base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
-- 
2.40.0

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

