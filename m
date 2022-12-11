Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227E1363
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Dec 2022 05:31:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id 17so1464460pll.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Dec 2022 21:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6vTvGihZUD6ZwLwPgKHPa+GfczIEiPsQ9GWLGBlels=;
        b=mYwjZvO8vfqs/z8B/xTKn8erWEJ1qWiRy8OC3llvni0LA7meFiM74AMfPCOawFKgU9
         XLXISPwZP67SdYUHMSVH0CshgvCkJFTmo+p/+CgoMH4SFVePfQsXbyGwlHc/b9ZIV1Z9
         eIza4KAel+svqQoeeKjau9ttNzPZJ3s6Gu7kGEO2V74zGeHm89bjTTOJk0Hbwu2/Owi4
         bmk94YOub3PhMF4SEq7nBN5VOilQUOWWe+KYrYjgWrLQNsvoWLZ3XZ5vLQRZcoIDHhDD
         CNN9/kaFdE2sMpP3tz8AUU7/qWr5pXge9DqJJXkcTlYSm7yXwLDxweSCTORnDWLvSCKb
         LN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6vTvGihZUD6ZwLwPgKHPa+GfczIEiPsQ9GWLGBlels=;
        b=xAtPbpYEvRKGQaTmIcXqjWtEGF0jpU633XMIFhvAuRtB2HZEM06eTiWCtuL4zH3vjX
         LpGud2QfesvsdXcrXWJL6LWa6LqolggkR/KtKUV3qdEtxn/MiriryaWyWQX7HFJKIN1c
         vDqHm4DuQIg+AJr2tSDFt2HfZOewT3dPNFgx2BWYKXAmtvt6v/oWDNe0Oh2iD4g7kfaL
         wMExqgM3nTQfYs7Qq3Go1UkvpqBuhdlLneNsCs7BMsIzwssTHPehyWmTOrtdYlXGA5zO
         xeqh+ZDIbu/4q5sx9tQArABqD7Bj4oy+XlMYXU2FbB00aOCGx0GNz34vv+9balcD2Lah
         UUbA==
X-Gm-Message-State: ANoB5plErHJlC1uzkuYVgxAz7gTejzLkBHoHPjCmkME71E00lEf7La5J
	R8zpoAETzy3fV0AbtCd7w0g=
X-Google-Smtp-Source: AA0mqf6oalOJMzb3tShfki8wjIKr/gLy4mMu1RvV9fXaLpaV2P7WB5n3RlqGwu2l/dnx9gVZ5L5zHg==
X-Received: by 2002:a17:90a:e2d1:b0:219:4bdb:92f4 with SMTP id fr17-20020a17090ae2d100b002194bdb92f4mr11539081pjb.15.1670736680978;
        Sat, 10 Dec 2022 21:31:20 -0800 (PST)
Received: from debian.me (subs28-116-206-12-36.three.co.id. [116.206.12.36])
        by smtp.gmail.com with ESMTPSA id k30-20020a17090a4ca100b0020a11217682sm3189190pjh.27.2022.12.10.21.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 21:31:20 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 64D7D10452A; Sun, 11 Dec 2022 12:31:15 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Cc: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Documentation: gpu: vc4: add blank line separator before KUnit code block
Date: Sun, 11 Dec 2022 12:30:52 +0700
Message-Id: <20221211053051.18125-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <202212102116.A10vg3jG-lkp@intel.com>
References: <202212102116.A10vg3jG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=bagasdotme@gmail.com; h=from:subject; bh=pvBilcpCv4aXZhOeJEGAFfrgfoZtHWn/dmtVyYkJ0t8=; b=owGbwMvMwCH2bWenZ2ig32LG02pJDMlTs1n8lXepN9h6b9l4h21q9Y1Zjx9Yb6mZ8pLhU/gMVr8t XRccOkpZGMQ4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCR63aMDJdW+rqEfL7Vv+bRRIOqw8 J8d44t3XbgZdbnAh1+zZQbD54wMkz7LXOxL3ezz0rPg//yz13n/vipkelb+X+553GWquXqLWwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

kernel test robot reports htmldocs warning:

Documentation/gpu/vc4.rst:65: WARNING: Unexpected indentation.

The warning is due to missing blank line separator between KUnit mock
driver sentence and its code block.

Add the separator to fix the warning.

Link: https://lore.kernel.org/linux-doc/202212102116.A10vg3jG-lkp@intel.com/
Fixes: 5304c8e6010012 ("Documentation: gpu: vc4: Add KUnit Tests Section")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/vc4.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/vc4.rst b/Documentation/gpu/vc4.rst
index a2375f1584e6d9..ec920c4f5bb322 100644
--- a/Documentation/gpu/vc4.rst
+++ b/Documentation/gpu/vc4.rst
@@ -62,6 +62,7 @@ integration tests.
 
 These tests are using a mock driver and can be ran using the
 command::
+
 	./tools/testing/kunit/kunit.py run \
 		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
 		--cross_compile aarch64-linux-gnu- --arch arm64

base-commit: 612e241fb4bcd98d8ff9da7a795abb86b8ccfe38
-- 
An old man doll... just what I always wanted! - Clara

