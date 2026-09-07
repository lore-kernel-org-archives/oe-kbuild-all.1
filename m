Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4519F2D949F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787337; cv=none; b=PYsSDnhUdxlJxubfPh1RIB2gWhjbqrYR+zos1h0iBRgRYIrtWiE5eVQZshVQRIIhfQIT0HVQKnAif6FSX5MT+iB5bA2RMchN6nxsYB/+fa63gb2EnLOSZg26q1gTs3Rca38fjPBlus1brs4+urJzp8vI4PqwuCtom4J+PpSz6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787337; c=relaxed/simple;
	bh=NU+eZSzEsrnjCal8oIlsrDjpb9U7xXSSdQQ4LiKYAH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhBDBR0VPvoE/yQqIIqbmj2NHXJGvi0SZ/dSgBmd6Wn3XADMWZGWRDlvL5PgldoFoUYNe6IUp0wP/N+omNezlZMAFr8I3TocPoqa5IvruVdK41n5U34az6MUg06TMCJqkttRB739FRdZvjfHNQ6MynRgFOypvkQkr8POPthP8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niix3k7H; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niix3k7H"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b9320423cso40117315e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Sep 2026 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788787328; x=1789392128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViElzflaszjSFY7ZUxClX7Wwc/oOQXR/RJoA4DtKYyY=;
        b=niix3k7HCp2ZkAItNayCmzafu8e+tVVdhpaDU/77ad7c2+qAUDwfIRGNe/TViVO2OI
         0PZjKyjPmaFWpMkeISRAxGtmeVEYOVcRFPgfZzSAPC4JJ+n6trsHI8qFbw3CRuv8Ymci
         Ioq/2zbufrIEd8GLffngSh/ZUSAsAILgFaeZjd5UjJtcwokb7DSrsCXihduk7FmxGUvt
         ss0Nb1fUouOS5xJj3CNd5DAAjly4aui5lWsUYkZJd7Zs/bUPFBy4ILzbD4F72h12mFoP
         Zo6uIQ/k32ugLhro9pswIPMSXZvufUIEx3ISVA8lDhZdaUrVXtGX9Do9mIpky2qKbOmZ
         rUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787328; x=1789392128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViElzflaszjSFY7ZUxClX7Wwc/oOQXR/RJoA4DtKYyY=;
        b=nc/GKhkVbVfk4jf6EBzoblmXG1l03EqRGe30Ovrc3Vxv7TwpwnpZwtDXzhurZ39XPH
         q6Ja4OhC8AjVTgdFQU63csc494PEWSmbJOGoCNX4Z9LSDfsDnEFmzc/qY82Nj+hz81tL
         08Kz4UrtzrZiZ0LQidZCnKH89603uQv2jG6V+h7wu2El+U+VsFm3ZhlRe2ms6tcsHRuP
         gT9tjWPheGYLd4+HdczMyCjVJWJ2RjS+vbn4xfS193xsJagtolc7HeF2VDl39M90vsWG
         v2nEa0s599rPr7C9m3BjXhr9TjZuDEoOLXNsjaTY8YRANjdktY+3MqpAJh6kDzW6uLV5
         LxTg==
X-Forwarded-Encrypted: i=1; AKwUvBx15lXHGuNLFg7Veixrzhdmkw2MmbTImJPiUT0uhP59BHRiJsmza7/FJPbfBkmo9w/nxY/V/Ly2JyE7MRPQ@lists.linux.dev
X-Gm-Message-State: AFuF++nG4GkdI3WhRzo6IONGDNr8K9xGweApdv7ibw03JKARervuIqh8
	VNyl/oKoIQfadLfA1dk9cCDh5KhPlvmYiONbHNyw3TRkegVrS0jGN8Iy
X-Gm-Gg: AYBFou2+rooIl7h4LkVTH6nGTQHXWLHC6wPuNkblTAf8FzWFtsH+vft49k00BHuxN0v
	8bGeRz7kWZkl+1jCYvQoTKn3JoSECt7feXra9jy8zz6Q9NgCmgfd7fjDMDTNkvKVE9AsKvwgeZP
	jo1wDNyFD+skUinrZtxF97gACf/dNi6gXrbw57AoYq/cne3z68So8YEQvYHeThJHhda/oOrm3+Z
	MdBfL9J6JKn+oeS98A100CUu3S4WLXTGwFeDeL7bzqMNgy4hyyjIAP/6/UoWYO/H+EOfWkSoYRz
	BrBjOW4CvABoBubYVkkffWr4kQ4c7p8kHB5ORPWKy9dkuTUCqr1WaYt3NZvuovlMmbcZ5P82pH2
	9Vj5HFvFgNQqaBx4T0Mk5LCgUAeyOWCi9qZp0kHhVVzkNq2Gg2/eSAcFezTOju+gG0pJ+MGKxSJ
	GMl8gmeBkHWig88egwrsTlK/XS5NXBEuEqGliTtHB76CgBmRd5h6W9Tmpyp35gRpKrOJelVHj5+
	YO5ncTefZ43F3Z7Q0p5+7G4B2KmqelqgsnV2uNUYwGriKHoNq+g6U8tODak6JWP7fY+qxc7IeeH
	XiYwHQRS5i9ftEHm9bXWBprKiMH4Iz7g5zwgU1IF2neWZlFlkgPtTO4I6Dz0HZaWI6uB/Pittiy
	GXj4OFp4HNtuK50ClbQ==
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr448928055e9.2.1788787327897;
        Mon, 07 Sep 2026 06:22:07 -0700 (PDT)
Received: from Ubuntu.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27458397f8f.8.2026.09.07.06.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:22:07 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [PATCH] ocfs2: remove unnecessary ret variable in ocfs2_calc_xattr_init()
Date: Mon,  7 Sep 2026 15:22:00 +0200
Message-ID: <20260907132202.48834-1-krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <202609040247.8B3lmoqX-lkp@intel.com>
References: <202609040247.8B3lmoqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bd7c05fb4a47 ("ocfs2: fix circular locking dependency in
ocfs2_init_acl()") removed the only code that could change ret in
ocfs2_calc_xattr_init(). The variable is now always zero, so remove it
and return zero directly.

This fixes the reported Coccinelle warning without changing behavior.

Fixes: bd7c05fb4a47 ("ocfs2: fix circular locking dependency in ocfs2_init_acl()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609040247.8B3lmoqX-lkp@intel.com/
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
 fs/ocfs2/xattr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 35bcbb0ff607..ab3b645983c9 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -640,7 +640,6 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
 			  int *want_clusters, int *xattr_credits,
 			  int *want_meta, struct ocfs2_acl_state *acl_state)
 {
-	int ret = 0;
 	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
 	int s_size = 0, a_size = 0, acl_len = 0, new_clusters;
 
@@ -662,7 +661,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
 	}
 
 	if (!(s_size + a_size))
-		return ret;
+		return 0;
 
 	/*
 	 * The max space of security xattr taken inline is
@@ -729,7 +728,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ocfs2_xattr_extend_allocation(struct inode *inode,

base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
-- 
2.53.0

