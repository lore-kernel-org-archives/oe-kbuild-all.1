Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806784;
	b=T4uVHoaV7grpHHIriTYiSHPYvVpfnMXONrymj8wcEg3RXuvmD4ONjaBQLeSYXp/YQ9fv
	 1HWjdL5zP2Wu8rlJ+9GUCHB8nKE6WrY0am8HdHG4KDSkCgevUp0IyTPDAk3P6qh7IkBAI
	 R/lOIwgLrJtCjwePfJfWEaHHfsTE9aWxvI9h+CONp/ep7x82YRzCyMoktPHn7tWgSsXKH
	 C5iHxoifdpbDgMiguMZeCjgmO/TyiNu7jdAEOGihZB140g0Ou6KhUaCqF24eUIpT/+6ne
	 mXHWI6cyKJ/W1664rLjUeWKzG7gcb/k0NNMQH+fLobekVwUgJTzT6/c/SA9xiNzu+pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=hz56qYSOSs9DQhsj5maa5eeVQHnnDEv1CGruA/BwN70=;
	b=ZFY7pjsrR6+9Hx2xSd/6AkOm1FrQ5JDm+lLvmqp2/P7O4JrE8EnC8/dMLysoWhYpP5cu
	 8FG8oLj4Rj5bvkM6qiEQTPAViZqUDbs5ShGSFTjXYXdZriO331hLfNMECeL6hyIkowwlD
	 SrFgFIGWM7cXGfVOzAFLoU7WhEzo8B363qDoqU72DdH0VfwcwumaHIX2co/lBj+eiD1Wk
	 KGkh7Yxz2pnKCBsJDP7e8q/vMwztrBMZngTsUZQ4rBpeQI6hDE0VWbMUTkdH5QTcJE/Id
	 Ta4p8IaOGyq9HV5fupGs3NN3fFWg0VhXxSeZwd/CiyEwj+LoxH8LNS1wCth5HYKFtCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLzISRzO;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D4606A329
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 05:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cLzISRzO
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4922523d1afso1435174f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 21:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806783; x=1795411583; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz56qYSOSs9DQhsj5maa5eeVQHnnDEv1CGruA/BwN70=;
        b=cLzISRzOWMMi/GURKCeRJOLZeFc7WooTXLRZSYDclZ+TW5IoewfL9iOZ2FP6ubOz41
         PCGJxE7YRW4B/D33dJmy4nNkuWITyQFHBHl7fNeMh8B9DLos1FUNC8bHRK9B72D3y+Ce
         HTK0emXXR8bcVTxatjZFPH+xr1sAEXEME5m18Jq53VBku+dCU+Keoxzkmf5kemdg/ghf
         fPCxfJX0yY1/28FdPS23V/h2VpPVfsN1e4CcSVLBv2anrzJhol/wGKiuM7vyAlQ1Z81V
         nDy+sbCPz/y6+eDKRRghSA+3cPKRMWiVNAPvQpjk9aEFkbImt9sl3L+Ip3p2yV2lJGri
         SrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806783; x=1795411583;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz56qYSOSs9DQhsj5maa5eeVQHnnDEv1CGruA/BwN70=;
        b=FShdpE4wZuemcz6u2NTLsIub08TXQrclqK0ZfKCKiqcv+b4JcjQV31Nnt8eqinyfmj
         mFxuvO9ETdw+nC40iwH1yQ4OV/7QzajbeVTjHmxAMazN/7fZmfFS1m9KxtL4eg6/TObt
         D0xLsyrvddj8OvKXCZKj0AEUHraYCMmd/8Pr5m0F+0fv2zWIGFsED2imvFcOgKtgAI88
         4fUJn4JBIlEzUuwCtim2UUpQqronIpNfO7M6xpUQp+AA4KK5pHqaCeDySiTKdn7i2/j4
         Sef45GyZBou8kFDshwLQKJ4eNEiqp0oum1GjU/jlm2zSPX4PfafydjXgWEZhcKnoL4fD
         cWuQ==
X-Forwarded-Encrypted: i=1; AL+hErF31E5JYQg72zqU7JV88W+H0KknpxfUVdBTvOtOtIEVwJYSSBVv2h/X/Luh5cuWTnugdiTqk076OxImGYRI@lists.linux.dev
X-Gm-Message-State: APuU4Z/glQGrskC+w+ptvqbcO19EtxQtNp6kT68p9V0jpfBszWpfixNE
	oZoLe1RX4xYNv79eCBTRsqFVyPjavulBq0gZ6Qik0f+aWmI62YMhXd7S
X-Gm-Gg: AYBFou2ngPFM5oH2jZar+TYGKLj0LKc1mtPtoaBxbTRp5W6HiDI/4KwxthGnckvDBzi
	GCowO4BP5Gin7Xum6OibHG6PfmNADAFSmWhCOvxO80JpQi80gAdeFoAPLkJVQPI+3n5+VuFaxLT
	+sUOLxzerYa8i2XPCxqVEHY5PFnLbmrGeybKaHN1Im3jaEkkR81Mudv9NctPYXoRyJ1L6BTwE2D
	D5Riq+EJxg81ewX6Y6MmGnO7258f11kUeRttES7/ctjVRIvJkmYfH6rQrpz/3k2wXFz7TTHkAJf
	ejnLYHGiG/nA8qHdNtoq+IuF0yz7IDleyeRPnADhaOL4JxfSzzUBY4INYOdRayCO4GK2QGvg+XG
	2CW54NRNrnCJZC6erotbffUpv/+wAFfwZS4YO8oHGzfoFLusEdLNirsjIjf5I7QPW5M9rRrGFPo
	RRAvlhY1FPYie4vzSDjnPuatG3vOVnGIAFJ0nMieHuSXIGxYF9fjfudDVI8vTaF70/GQKyjlI6o
	8GP4PE0g1ooA1JFwLMbEIDmZHVnladuQlWe0rNI2BdiTJxV1zHxKfeZd8DKYMHBu3hhXWGtrRyI
	KdY3z34uy5uV6x3YyDOG79njwhHQYZEDZkBkxkBQ+IS3XywVDtUifCm1bghKNKN6rceNcDp8v5+
	xL8VZ8Rv0NCTGyQVAR7z7CTMukm91m26UWXyxA5LM2qm94Hai2t0kNLsVis2knVLRUow=
X-Received: by 2002:a05:6000:26c8:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49c73ce5e65mr21515228f8f.37.1794806782617;
        Sun, 15 Nov 2026 21:26:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm16137617f8f.53.2026.11.15.21.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:26:22 -0800 (PST)
Date: Mon, 16 Nov 2026 08:26:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Phillip Lougher <phillip@squashfs.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	mm-commits@vger.kernel.org
Subject: [akpm-mm:mm-nonmm-unstable 139/151] fs/squashfs/namei.c:283
 squashfs_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <202611131955.0Gd7ipSP-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   152f0559e66c079f717de375f133ff127afb1f58
commit: 5213b0a08263b2191b86b046c3a63f11e8abc399 [139/151] Squashfs: fix variables in directory code and add more sanity checks
config: um-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131955.0Gd7ipSP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611131955.0Gd7ipSP-lkp@intel.com/

New smatch warnings:
fs/squashfs/namei.c:283 squashfs_lookup() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +283 fs/squashfs/namei.c

c88da2c979369e6 Phillip Lougher 2009-01-05  164  static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
00cd8dd3bf95f2c Al Viro         2012-06-10  165  				 unsigned int flags)
c88da2c979369e6 Phillip Lougher 2009-01-05  166  {
c88da2c979369e6 Phillip Lougher 2009-01-05  167  	const unsigned char *name = dentry->d_name.name;
c88da2c979369e6 Phillip Lougher 2009-01-05  168  	int len = dentry->d_name.len;
c88da2c979369e6 Phillip Lougher 2009-01-05  169  	struct inode *inode = NULL;
c88da2c979369e6 Phillip Lougher 2009-01-05  170  	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
c88da2c979369e6 Phillip Lougher 2009-01-05  171  	struct squashfs_dir_header dirh;
4dddf794b08bef0 Phillip Lougher 2026-11-11  172  	struct squashfs_dir_entry *dire = NULL;
4dddf794b08bef0 Phillip Lougher 2026-11-11  173  	u64 block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
c88da2c979369e6 Phillip Lougher 2009-01-05  174  	int offset = squashfs_i(dir)->offset;
5213b0a08263b21 Phillip Lougher 2026-11-11  175  	int err;
5213b0a08263b21 Phillip Lougher 2026-11-11  176  	loff_t length;
52e9ce1c0f20606 Phillip Lougher 2013-09-03  177  	unsigned int dir_count, size;
c88da2c979369e6 Phillip Lougher 2009-01-05  178  
4dddf794b08bef0 Phillip Lougher 2026-11-11  179  	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start, offset);
4dddf794b08bef0 Phillip Lougher 2026-11-11  180  
4dddf794b08bef0 Phillip Lougher 2026-11-11  181  	if (block < 0)
4dddf794b08bef0 Phillip Lougher 2026-11-11  182  		goto data_error;
c88da2c979369e6 Phillip Lougher 2009-01-05  183  
c88da2c979369e6 Phillip Lougher 2009-01-05  184  	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
c88da2c979369e6 Phillip Lougher 2009-01-05  185  	if (dire == NULL) {
c88da2c979369e6 Phillip Lougher 2009-01-05  186  		ERROR("Failed to allocate squashfs_dir_entry\n");
c88da2c979369e6 Phillip Lougher 2009-01-05  187  		return ERR_PTR(-ENOMEM);
c88da2c979369e6 Phillip Lougher 2009-01-05  188  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  189  
c88da2c979369e6 Phillip Lougher 2009-01-05  190  	if (len > SQUASHFS_NAME_LEN) {
c88da2c979369e6 Phillip Lougher 2009-01-05  191  		err = -ENAMETOOLONG;
c88da2c979369e6 Phillip Lougher 2009-01-05  192  		goto failed;
c88da2c979369e6 Phillip Lougher 2009-01-05  193  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  194  
c88da2c979369e6 Phillip Lougher 2009-01-05  195  	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
c88da2c979369e6 Phillip Lougher 2009-01-05  196  				squashfs_i(dir)->dir_idx_start,
c88da2c979369e6 Phillip Lougher 2009-01-05  197  				squashfs_i(dir)->dir_idx_offset,
5213b0a08263b21 Phillip Lougher 2026-11-11  198  				squashfs_i(dir)->dir_idx_cnt,
5213b0a08263b21 Phillip Lougher 2026-11-11  199  				i_size_read(dir), name);
c88da2c979369e6 Phillip Lougher 2009-01-05  200  
c88da2c979369e6 Phillip Lougher 2009-01-05  201  	while (length < i_size_read(dir)) {
c88da2c979369e6 Phillip Lougher 2009-01-05  202  		/*
c88da2c979369e6 Phillip Lougher 2009-01-05  203  		 * Read directory header.
c88da2c979369e6 Phillip Lougher 2009-01-05  204  		 */
5213b0a08263b21 Phillip Lougher 2026-11-11  205  		if (!squashfs_dir_space(dir, length, sizeof(dirh)))
5213b0a08263b21 Phillip Lougher 2026-11-11  206  			goto read_failure;
5213b0a08263b21 Phillip Lougher 2026-11-11  207  
c88da2c979369e6 Phillip Lougher 2009-01-05  208  		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
c88da2c979369e6 Phillip Lougher 2009-01-05  209  				&offset, sizeof(dirh));
c88da2c979369e6 Phillip Lougher 2009-01-05  210  		if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  211  			goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  212  
c88da2c979369e6 Phillip Lougher 2009-01-05  213  		length += sizeof(dirh);
c88da2c979369e6 Phillip Lougher 2009-01-05  214  
c88da2c979369e6 Phillip Lougher 2009-01-05  215  		dir_count = le32_to_cpu(dirh.count) + 1;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  216  
4826d83d9c4f6bb Ajeet Yadav     2012-02-02  217  		if (dir_count > SQUASHFS_DIR_COUNT)
44cff8a9ee8a974 Phillip Lougher 2011-03-15  218  			goto data_error;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  219  
c88da2c979369e6 Phillip Lougher 2009-01-05  220  		while (dir_count--) {
c88da2c979369e6 Phillip Lougher 2009-01-05  221  			/*
c88da2c979369e6 Phillip Lougher 2009-01-05  222  			 * Read directory entry.
c88da2c979369e6 Phillip Lougher 2009-01-05  223  			 */
5213b0a08263b21 Phillip Lougher 2026-11-11  224  			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
5213b0a08263b21 Phillip Lougher 2026-11-11  225  				goto read_failure;

We need an error code on this path.

5213b0a08263b21 Phillip Lougher 2026-11-11  226  
c88da2c979369e6 Phillip Lougher 2009-01-05  227  			err = squashfs_read_metadata(dir->i_sb, dire, &block,
c88da2c979369e6 Phillip Lougher 2009-01-05  228  					&offset, sizeof(*dire));
c88da2c979369e6 Phillip Lougher 2009-01-05  229  			if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  230  				goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  231  
5213b0a08263b21 Phillip Lougher 2026-11-11  232  			length += sizeof(*dire);
c88da2c979369e6 Phillip Lougher 2009-01-05  233  			size = le16_to_cpu(dire->size) + 1;
c88da2c979369e6 Phillip Lougher 2009-01-05  234  
44cff8a9ee8a974 Phillip Lougher 2011-03-15  235  			/* size should never be larger than SQUASHFS_NAME_LEN */
44cff8a9ee8a974 Phillip Lougher 2011-03-15  236  			if (size > SQUASHFS_NAME_LEN)
44cff8a9ee8a974 Phillip Lougher 2011-03-15  237  				goto data_error;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  238  
5213b0a08263b21 Phillip Lougher 2026-11-11  239  			if (!squashfs_dir_space(dir, length, size))
5213b0a08263b21 Phillip Lougher 2026-11-11  240  				goto read_failure;

And here.

5213b0a08263b21 Phillip Lougher 2026-11-11  241  
c88da2c979369e6 Phillip Lougher 2009-01-05  242  			err = squashfs_read_metadata(dir->i_sb, dire->name,
c88da2c979369e6 Phillip Lougher 2009-01-05  243  					&block, &offset, size);
c88da2c979369e6 Phillip Lougher 2009-01-05  244  			if (err < 0)
c88da2c979369e6 Phillip Lougher 2009-01-05  245  				goto read_failure;
c88da2c979369e6 Phillip Lougher 2009-01-05  246  
5213b0a08263b21 Phillip Lougher 2026-11-11  247  			length += size;
c88da2c979369e6 Phillip Lougher 2009-01-05  248  
c88da2c979369e6 Phillip Lougher 2009-01-05  249  			if (name[0] < dire->name[0])
c88da2c979369e6 Phillip Lougher 2009-01-05  250  				goto exit_lookup;
c88da2c979369e6 Phillip Lougher 2009-01-05  251  
c88da2c979369e6 Phillip Lougher 2009-01-05  252  			if (len == size && !strncmp(name, dire->name, len)) {
c88da2c979369e6 Phillip Lougher 2009-01-05  253  				unsigned int blk, off, ino_num;
c88da2c979369e6 Phillip Lougher 2009-01-05  254  				long long ino;
c88da2c979369e6 Phillip Lougher 2009-01-05  255  				blk = le32_to_cpu(dirh.start_block);
c88da2c979369e6 Phillip Lougher 2009-01-05  256  				off = le16_to_cpu(dire->offset);
c88da2c979369e6 Phillip Lougher 2009-01-05  257  				ino_num = le32_to_cpu(dirh.inode_number) +
c88da2c979369e6 Phillip Lougher 2009-01-05  258  					(short) le16_to_cpu(dire->inode_number);
cec4a69189091ba Phillip Lougher 2026-11-11  259  				ino = squashfs_mkinode(blk, off);
c88da2c979369e6 Phillip Lougher 2009-01-05  260  
c88da2c979369e6 Phillip Lougher 2009-01-05  261  				TRACE("calling squashfs_iget for directory "
c88da2c979369e6 Phillip Lougher 2009-01-05  262  					"entry %s, inode  %x:%x, %d\n", name,
c88da2c979369e6 Phillip Lougher 2009-01-05  263  					blk, off, ino_num);
c88da2c979369e6 Phillip Lougher 2009-01-05  264  
c88da2c979369e6 Phillip Lougher 2009-01-05  265  				inode = squashfs_iget(dir->i_sb, ino, ino_num);
c88da2c979369e6 Phillip Lougher 2009-01-05  266  				goto exit_lookup;
c88da2c979369e6 Phillip Lougher 2009-01-05  267  			}
c88da2c979369e6 Phillip Lougher 2009-01-05  268  		}
c88da2c979369e6 Phillip Lougher 2009-01-05  269  	}
c88da2c979369e6 Phillip Lougher 2009-01-05  270  
c88da2c979369e6 Phillip Lougher 2009-01-05  271  exit_lookup:
c88da2c979369e6 Phillip Lougher 2009-01-05  272  	kfree(dire);
c88da2c979369e6 Phillip Lougher 2009-01-05  273  	return d_splice_alias(inode, dentry);
c88da2c979369e6 Phillip Lougher 2009-01-05  274  
44cff8a9ee8a974 Phillip Lougher 2011-03-15  275  data_error:
44cff8a9ee8a974 Phillip Lougher 2011-03-15  276  	err = -EIO;
44cff8a9ee8a974 Phillip Lougher 2011-03-15  277  
c88da2c979369e6 Phillip Lougher 2009-01-05  278  read_failure:
c88da2c979369e6 Phillip Lougher 2009-01-05  279  	ERROR("Unable to read directory block [%llx:%x]\n",
4dddf794b08bef0 Phillip Lougher 2026-11-11  280  		squashfs_i(dir)->start, squashfs_i(dir)->offset);
c88da2c979369e6 Phillip Lougher 2009-01-05  281  failed:
c88da2c979369e6 Phillip Lougher 2009-01-05  282  	kfree(dire);
c88da2c979369e6 Phillip Lougher 2009-01-05 @283  	return ERR_PTR(err);
c88da2c979369e6 Phillip Lougher 2009-01-05  284  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

