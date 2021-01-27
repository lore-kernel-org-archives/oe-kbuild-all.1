Content-Type: multipart/mixed; boundary="===============6752265948412680226=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [hch-misc:dma_alloc_noncontiguous 3/10] drivers/media/common/videobuf2/videobuf2-dma-contig.c:188 vb2_dc_mmap() warn: variable dereferenced before check 'buf' (see line 185)
Date: Thu, 28 Jan 2021 00:41:53 +0900
Message-ID: <YBGJwVyFyBbY5Xc4@jagdpanzerIV.localdomain>
In-Reply-To: <20210127123213.GA5899@lst.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6752265948412680226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (21/01/27 13:32), Christoph Hellwig wrote:
> > > smatch warnings:
> > > drivers/media/common/videobuf2/videobuf2-dma-contig.c:188 vb2_dc_mmap=
() warn: variable dereferenced before check 'buf' (see line 185)
> > > =

> > > vim +/buf +188 drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > > =

> > > f7f129ce2e33f9 drivers/media/v4l2-core/videobuf2-dma-contig.c        =
Laurent Pinchart   2012-06-14  182  static int vb2_dc_mmap(void *buf_priv, =
struct vm_area_struct *vma)
> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  183  {
> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  184  	struct vb2_dc_buf *buf =3D buf_priv;
> > > 6673227deba5cf drivers/media/common/videobuf2/videobuf2-dma-contig.c =
Sergey Senozhatsky 2020-11-27 @185  	struct vb2_queue *q =3D buf->vb->vb2_q=
ueue;
> > >                                                                      =
                                                                 ^^^^^
> > > Dereference
> > > =

> > > c60520fa50cd86 drivers/media/v4l2-core/videobuf2-dma-contig.c        =
Marek Szyprowski   2012-06-14  186  	int ret;
> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  187  =

> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11 @188  	if (!buf) {
> > >                                                                      =
                                               ^^^^
> > > NULL check is too late.
> > > =

> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  189  		printk(KERN_ERR "No buffer to map\n");
> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  190  		return -EINVAL;
> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  191  	}
> > > 1a758d4e847f77 drivers/media/video/videobuf2-dma-contig.c            =
Pawel Osciak       2010-10-11  192  =

> > > 6673227deba5cf drivers/media/common/videobuf2/videobuf2-dma-contig.c =
Sergey Senozhatsky 2020-11-27  193  	ret =3D dma_mmap_attrs(buf->dev, vma, =
buf->cookie, buf->dma_addr,
> > > 6673227deba5cf drivers/media/common/videobuf2/videobuf2-dma-contig.c =
Sergey Senozhatsky 2020-11-27  194  			     buf->size, q->dma_attrs);
> > > c60520fa50cd86 drivers/media/v4l2-core/videobuf2-dma-contig.c        =
Marek Szyprowski   2012-06-14  195  	if (ret) {
> > > c60520fa50cd86 drivers/media/v4l2-core/videobuf2-dma-contig.c        =
Marek Szyprowski   2012-06-14  196  		pr_err("Remapping memory failed, erro=
r: %d\n", ret);
> > =

> > Oh, yeah...
> > =

> > I'll take a look. My WIP branch is not really ready for the show yet.
> =

> Could also be that I messed it up when porting to the new API..

Rather unlikely ;)

I'm reworking some of the patches in my WIP branch. For instance, I
don't think that reading queue->flags is ->preare and ->finish is
correct: the queue can be reconfigured while the buffers are still
on the fly, so we'll read stale data. So vb2_queue->non_consistent_mem
should be store in buffers, during allocation.

Need some more time.

	-ss
--===============6752265948412680226==--

