Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED3D5382
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 09:04:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 626931FD92;
	Mon, 18 Sep 2023 09:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1695027842; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y8ulxZTAU8ZHRSVUlnFEqeNxmI2g5k3RdNfkDBzDyL4=;
	b=QanKoGQDn+l/JZ21hEKb+AMs28Dq5uMeR9Nld3yJhyelrsKXD+fQWu0yhKkOvf8o/eL133
	TUbfm5z033M+P24F1F3RBppZXJh4LsRzwrrJGrL8cjO6I5BLv8Sw6AhQKhRdo6xpJiWFsZ
	ZizWAnL1AcrKj2kqj12ABhoiGUwA5vs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695027842;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=y8ulxZTAU8ZHRSVUlnFEqeNxmI2g5k3RdNfkDBzDyL4=;
	b=54tZC2yWZS+MbxdWdVOcFqsWohg5jRmfAqQ3t+wOtGjMKL6HtRuU2g8FpClwaYuF+9q6TC
	gprw7VKHpq/QNhBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A5CA13480;
	Mon, 18 Sep 2023 09:04:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tgl1CYISCGX7CgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 18 Sep 2023 09:04:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	sam@ravnborg.org,
	arnd@arndb.de,
	javierm@redhat.com,
	rdunlap@infradead.org,
	glaubitz@physik.fu-berlin.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] fbdev/sh7760fb: Depend on FB=y
Date: Mon, 18 Sep 2023 11:03:49 +0200
Message-ID: <20230918090400.13264-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix linker error if FB=m about missing fb_io_read and fb_io_write. The
linker's error message suggests that this config setting has already
been broken for other symbols.

  All errors (new ones prefixed by >>):

     sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_probe':
     sh7760fb.c:(.text+0x374): undefined reference to `framebuffer_alloc'
     sh4-linux-ld: sh7760fb.c:(.text+0x394): undefined reference to `fb_videomode_to_var'
     sh4-linux-ld: sh7760fb.c:(.text+0x39c): undefined reference to `fb_alloc_cmap'
     sh4-linux-ld: sh7760fb.c:(.text+0x3a4): undefined reference to `register_framebuffer'
     sh4-linux-ld: sh7760fb.c:(.text+0x3ac): undefined reference to `fb_dealloc_cmap'
     sh4-linux-ld: sh7760fb.c:(.text+0x434): undefined reference to `framebuffer_release'
     sh4-linux-ld: drivers/video/fbdev/sh7760fb.o: in function `sh7760fb_remove':
     sh7760fb.c:(.text+0x800): undefined reference to `unregister_framebuffer'
     sh4-linux-ld: sh7760fb.c:(.text+0x804): undefined reference to `fb_dealloc_cmap'
     sh4-linux-ld: sh7760fb.c:(.text+0x814): undefined reference to `framebuffer_release'
  >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0xc): undefined reference to `fb_io_read'
  >> sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x10): undefined reference to `fb_io_write'
     sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
     sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
     sh4-linux-ld: drivers/video/fbdev/sh7760fb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309130632.LS04CPWu-lkp@intel.com/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 4455bfd57f0ec..64ccb34d882dd 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1756,7 +1756,7 @@ config FB_COBALT
 
 config FB_SH7760
 	bool "SH7760/SH7763/SH7720/SH7721 LCDC support"
-	depends on FB && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
+	depends on FB=y && (CPU_SUBTYPE_SH7760 || CPU_SUBTYPE_SH7763 \
 		|| CPU_SUBTYPE_SH7720 || CPU_SUBTYPE_SH7721)
 	select FB_IOMEM_HELPERS
 	help
-- 
2.42.0

