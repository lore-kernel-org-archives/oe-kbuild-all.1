Content-Type: multipart/mixed; boundary="===============1886629529170679980=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [hch-misc:dma_alloc_noncontiguous 3/10] drivers/media/common/videobuf2/videobuf2-dma-contig.c:188 vb2_dc_mmap() warn: variable dereferenced before check 'buf' (see line 185)
Date: Wed, 27 Jan 2021 13:32:13 +0100
Message-ID: <20210127123213.GA5899@lst.de>
In-Reply-To: <YBFanTqnBh+hsWKd@jagdpanzerIV.localdomain>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1886629529170679980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 09:20:45PM +0900, Sergey Senozhatsky wrote:
> On (21/01/27 08:58), Dan Carpenter wrote:
> > tree:   git://git.infradead.org/users/hch/misc.git dma_alloc_noncontigu=
ous
> > head:   ecc175d8a7100071b073720d6729bb3f40dae639
> > commit: 6673227deba5cfc9c90084f49988e044a2ca2933 [3/10] WIP videobuf2: =
rework vb2_mem_ops API
> > config: x86_64-randconfig-m001-20210126 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/media/common/videobuf2/videobuf2-dma-contig.c:188 vb2_dc_mmap()=
 warn: variable dereferenced before check 'buf' (see line 185)
> > =

> > vim +/buf +188 drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > =

> > f7f129ce2e33f9 drivers/media/v4l2-core/videobuf2-dma-contig.c        La=
urent Pinchart   2012-06-14  182  static int vb2_dc_mmap(void *buf_priv, st=
ruct vm_area_struct *vma)
> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  183  {
> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  184  	struct vb2_dc_buf *buf =3D buf_priv;
> > 6673227deba5cf drivers/media/common/videobuf2/videobuf2-dma-contig.c Se=
rgey Senozhatsky 2020-11-27 @185  	struct vb2_queue *q =3D buf->vb->vb2_que=
ue;
> >                                                                        =
                                                               ^^^^^
> > Dereference
> > =

> > c60520fa50cd86 drivers/media/v4l2-core/videobuf2-dma-contig.c        Ma=
rek Szyprowski   2012-06-14  186  	int ret;
> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  187  =

> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11 @188  	if (!buf) {
> >                                                                        =
                                             ^^^^
> > NULL check is too late.
> > =

> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  189  		printk(KERN_ERR "No buffer to map\n");
> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  190  		return -EINVAL;
> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  191  	}
> > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            Pa=
wel Osciak       2010-10-11  192  =

> > 6673227deba5cf drivers/media/common/videobuf2/videobuf2-dma-contig.c Se=
rgey Senozhatsky 2020-11-27  193  	ret =3D dma_mmap_attrs(buf->dev, vma, bu=
f->cookie, buf->dma_addr,
> > 6673227deba5cf drivers/media/common/videobuf2/videobuf2-dma-contig.c Se=
rgey Senozhatsky 2020-11-27  194  			     buf->size, q->dma_attrs);
> > c60520fa50cd86 drivers/media/v4l2-core/videobuf2-dma-contig.c        Ma=
rek Szyprowski   2012-06-14  195  	if (ret) {
> > c60520fa50cd86 drivers/media/v4l2-core/videobuf2-dma-contig.c        Ma=
rek Szyprowski   2012-06-14  196  		pr_err("Remapping memory failed, error:=
 %d\n", ret);
> =

> Oh, yeah...
> =

> I'll take a look. My WIP branch is not really ready for the show yet.

Could also be that I messed it up when porting to the new API..
--===============1886629529170679980==--

