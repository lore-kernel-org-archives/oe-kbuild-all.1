Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F8E19397
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 20:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692996502; x=1724532502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6KtFPFeYXR4d8KRd9f/IwQ+8OVOkqTnuEjuU+xHsTl4=;
  b=gGRJKkiHjtVe8HT4QNBhswTUw0VnIhcG8r93WKLEVT5/CWw/DuejJ7vB
   jAuPiZEPNGVgM9l6oYwhPu0Lb5dExyS9wmoFJ6IxSMrNkjTUmXSKvqVNe
   L1aTSX472I+ZEgtMaStE1Q6kl+1qWj8vtD6QG9bW0FduaxOQYmGHNXdTm
   wX1MDZqofzzHf5ZVXP/x2dCM0/c365fHNM37s8jbcETRt5lwkXd/kzy8g
   T+AC8S4b/VeQEvSZj7GZQE6/hryYVe3EG8zW7iG1Eb2LvQTwoCkBD013X
   v92EBUpb43DYibD4EQSf6GUv7SK+XHP6pgwjOBO9g9nDwgELQDfEh8Psa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="441145942"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="441145942"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 13:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861191938"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="861191938"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 13:48:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZdj7-0003zT-1x;
	Fri, 25 Aug 2023 20:48:17 +0000
Date: Sat, 26 Aug 2023 04:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 5/15]
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1645:29: warning:
 'mtk_jpeg_clocks' defined but not used
Message-ID: <202308260449.4waGEbm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   9f50ec26b7d119ab8dd62cb550e0656d8ea779cc
commit: 636ebe4a1be935f8cb0f2be16339f2992790ed77 [5/15] UPSTREAM: media: mtk-jpegenc: Fix a compilation issue
config: m68k-randconfig-r003-20230825 (https://download.01.org/0day-ci/archive/20230826/202308260449.4waGEbm7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260449.4waGEbm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260449.4waGEbm7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1645:29: warning: 'mtk_jpeg_clocks' defined but not used [-Wunused-variable]
    1645 | static struct clk_bulk_data mtk_jpeg_clocks[] = {
         |                             ^~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1640:29: warning: 'mt8173_jpeg_dec_clocks' defined but not used [-Wunused-variable]
    1640 | static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
         |                             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1481:20: warning: 'mtk_jpeg_dec_irq' defined but not used [-Wunused-function]
    1481 | static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1461:20: warning: 'mtk_jpeg_enc_irq' defined but not used [-Wunused-function]
    1461 | static irqreturn_t mtk_jpeg_enc_irq(int irq, void *priv)
         |                    ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1378:34: warning: 'mtk_jpeg_dec_m2m_ops' defined but not used [-Wunused-const-variable=]
    1378 | static const struct v4l2_m2m_ops mtk_jpeg_dec_m2m_ops = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1374:34: warning: 'mtk_jpeg_multicore_dec_m2m_ops' defined but not used [-Wunused-const-variable=]
    1374 | static const struct v4l2_m2m_ops mtk_jpeg_multicore_dec_m2m_ops = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1370:34: warning: 'mtk_jpeg_multicore_enc_m2m_ops' defined but not used [-Wunused-const-variable=]
    1370 | static const struct v4l2_m2m_ops mtk_jpeg_multicore_enc_m2m_ops = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1366:34: warning: 'mtk_jpeg_enc_m2m_ops' defined but not used [-Wunused-const-variable=]
    1366 | static const struct v4l2_m2m_ops mtk_jpeg_enc_m2m_ops = {
         |                                  ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1180:13: warning: 'mtk_jpegdec_worker' defined but not used [-Wunused-function]
    1180 | static void mtk_jpegdec_worker(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:986:13: warning: 'mtk_jpegenc_worker' defined but not used [-Wunused-function]
     986 | static void mtk_jpegenc_worker(struct work_struct *work)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:893:29: warning: 'mtk_jpeg_enc_qops' defined but not used [-Wunused-const-variable=]
     893 | static const struct vb2_ops mtk_jpeg_enc_qops = {
         |                             ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:884:29: warning: 'mtk_jpeg_dec_qops' defined but not used [-Wunused-const-variable=]
     884 | static const struct vb2_ops mtk_jpeg_dec_qops = {
         |                             ^~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:644:36: warning: 'mtk_jpeg_dec_ioctl_ops' defined but not used [-Wunused-const-variable=]
     644 | static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:614:36: warning: 'mtk_jpeg_enc_ioctl_ops' defined but not used [-Wunused-const-variable=]
     614 | static const struct v4l2_ioctl_ops mtk_jpeg_enc_ioctl_ops = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:79:28: warning: 'mtk_jpeg_dec_formats' defined but not used [-Wunused-variable]
      79 | static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
         |                            ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:31:28: warning: 'mtk_jpeg_enc_formats' defined but not used [-Wunused-variable]
      31 | static struct mtk_jpeg_fmt mtk_jpeg_enc_formats[] = {
         |                            ^~~~~~~~~~~~~~~~~~~~


vim +/mtk_jpeg_clocks +1645 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c

45f13a57d813445 Xia Jiang       2020-08-14  1460  
45f13a57d813445 Xia Jiang       2020-08-14 @1461  static irqreturn_t mtk_jpeg_enc_irq(int irq, void *priv)
45f13a57d813445 Xia Jiang       2020-08-14  1462  {
45f13a57d813445 Xia Jiang       2020-08-14  1463  	struct mtk_jpeg_dev *jpeg = priv;
45f13a57d813445 Xia Jiang       2020-08-14  1464  	u32 irq_status;
45f13a57d813445 Xia Jiang       2020-08-14  1465  	irqreturn_t ret = IRQ_NONE;
45f13a57d813445 Xia Jiang       2020-08-14  1466  
45f13a57d813445 Xia Jiang       2020-08-14  1467  	cancel_delayed_work(&jpeg->job_timeout_work);
45f13a57d813445 Xia Jiang       2020-08-14  1468  
45f13a57d813445 Xia Jiang       2020-08-14  1469  	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
45f13a57d813445 Xia Jiang       2020-08-14  1470  		     JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
45f13a57d813445 Xia Jiang       2020-08-14  1471  	if (irq_status)
45f13a57d813445 Xia Jiang       2020-08-14  1472  		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
45f13a57d813445 Xia Jiang       2020-08-14  1473  
45f13a57d813445 Xia Jiang       2020-08-14  1474  	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
45f13a57d813445 Xia Jiang       2020-08-14  1475  		return ret;
45f13a57d813445 Xia Jiang       2020-08-14  1476  
45f13a57d813445 Xia Jiang       2020-08-14  1477  	ret = mtk_jpeg_enc_done(jpeg);
45f13a57d813445 Xia Jiang       2020-08-14  1478  	return ret;
45f13a57d813445 Xia Jiang       2020-08-14  1479  }
45f13a57d813445 Xia Jiang       2020-08-14  1480  
b2f0d2724ba477d Rick Chang      2016-12-14 @1481  static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
b2f0d2724ba477d Rick Chang      2016-12-14  1482  {
b2f0d2724ba477d Rick Chang      2016-12-14  1483  	struct mtk_jpeg_dev *jpeg = priv;
b2f0d2724ba477d Rick Chang      2016-12-14  1484  	struct mtk_jpeg_ctx *ctx;
1b275e4e8b70dbf Ezequiel Garcia 2019-02-08  1485  	struct vb2_v4l2_buffer *src_buf, *dst_buf;
b2f0d2724ba477d Rick Chang      2016-12-14  1486  	struct mtk_jpeg_src_buf *jpeg_src_buf;
b2f0d2724ba477d Rick Chang      2016-12-14  1487  	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
b2f0d2724ba477d Rick Chang      2016-12-14  1488  	u32	dec_irq_ret;
b2f0d2724ba477d Rick Chang      2016-12-14  1489  	u32 dec_ret;
b2f0d2724ba477d Rick Chang      2016-12-14  1490  	int i;
b2f0d2724ba477d Rick Chang      2016-12-14  1491  
0058ff2befe3736 Xia Jiang       2020-08-14  1492  	cancel_delayed_work(&jpeg->job_timeout_work);
0058ff2befe3736 Xia Jiang       2020-08-14  1493  
2ac8015f156b55c Xia Jiang       2020-08-14  1494  	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
ba40be0fa21afd1 Minghsiu Tsai   2017-03-14  1495  	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
b2f0d2724ba477d Rick Chang      2016-12-14  1496  	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
b2f0d2724ba477d Rick Chang      2016-12-14  1497  	if (!ctx) {
b2f0d2724ba477d Rick Chang      2016-12-14  1498  		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
b2f0d2724ba477d Rick Chang      2016-12-14  1499  		return IRQ_HANDLED;
b2f0d2724ba477d Rick Chang      2016-12-14  1500  	}
b2f0d2724ba477d Rick Chang      2016-12-14  1501  
b2f0d2724ba477d Rick Chang      2016-12-14  1502  	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
b2f0d2724ba477d Rick Chang      2016-12-14  1503  	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
1b275e4e8b70dbf Ezequiel Garcia 2019-02-08  1504  	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
b2f0d2724ba477d Rick Chang      2016-12-14  1505  
b2f0d2724ba477d Rick Chang      2016-12-14  1506  	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
2ac8015f156b55c Xia Jiang       2020-08-14  1507  		mtk_jpeg_dec_reset(jpeg->reg_base);
b2f0d2724ba477d Rick Chang      2016-12-14  1508  
b2f0d2724ba477d Rick Chang      2016-12-14  1509  	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
b2f0d2724ba477d Rick Chang      2016-12-14  1510  		dev_err(jpeg->dev, "decode failed\n");
b2f0d2724ba477d Rick Chang      2016-12-14  1511  		goto dec_end;
b2f0d2724ba477d Rick Chang      2016-12-14  1512  	}
b2f0d2724ba477d Rick Chang      2016-12-14  1513  
1b275e4e8b70dbf Ezequiel Garcia 2019-02-08  1514  	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
1b275e4e8b70dbf Ezequiel Garcia 2019-02-08  1515  		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
b2f0d2724ba477d Rick Chang      2016-12-14  1516  				      jpeg_src_buf->dec_param.comp_size[i]);
b2f0d2724ba477d Rick Chang      2016-12-14  1517  
b2f0d2724ba477d Rick Chang      2016-12-14  1518  	buf_state = VB2_BUF_STATE_DONE;
b2f0d2724ba477d Rick Chang      2016-12-14  1519  
b2f0d2724ba477d Rick Chang      2016-12-14  1520  dec_end:
1b275e4e8b70dbf Ezequiel Garcia 2019-02-08  1521  	v4l2_m2m_buf_done(src_buf, buf_state);
1b275e4e8b70dbf Ezequiel Garcia 2019-02-08  1522  	v4l2_m2m_buf_done(dst_buf, buf_state);
b2f0d2724ba477d Rick Chang      2016-12-14  1523  	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
5827e4b14ee7882 Xia Jiang       2020-08-14  1524  	pm_runtime_put(ctx->jpeg->dev);
b2f0d2724ba477d Rick Chang      2016-12-14  1525  	return IRQ_HANDLED;
b2f0d2724ba477d Rick Chang      2016-12-14  1526  }
b2f0d2724ba477d Rick Chang      2016-12-14  1527  
b2f0d2724ba477d Rick Chang      2016-12-14  1528  static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
b2f0d2724ba477d Rick Chang      2016-12-14  1529  {
b2f0d2724ba477d Rick Chang      2016-12-14  1530  	struct mtk_jpeg_q_data *q = &ctx->out_q;
b4a82f5d15102ad Xia Jiang       2020-08-14  1531  	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
b2f0d2724ba477d Rick Chang      2016-12-14  1532  
45f13a57d813445 Xia Jiang       2020-08-14  1533  	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
0b90056a39ed232 Xia Jiang       2020-08-14  1534  	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
0b90056a39ed232 Xia Jiang       2020-08-14  1535  	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
0b90056a39ed232 Xia Jiang       2020-08-14  1536  	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
0b90056a39ed232 Xia Jiang       2020-08-14  1537  	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
b2f0d2724ba477d Rick Chang      2016-12-14  1538  
b4a82f5d15102ad Xia Jiang       2020-08-14  1539  	q->fmt = mtk_jpeg_find_format(jpeg->variant->formats,
b4a82f5d15102ad Xia Jiang       2020-08-14  1540  				      jpeg->variant->num_formats,
b4a82f5d15102ad Xia Jiang       2020-08-14  1541  				      jpeg->variant->out_q_default_fourcc,
2ac8015f156b55c Xia Jiang       2020-08-14  1542  				      MTK_JPEG_FMT_FLAG_OUTPUT);
84bb4d04eb7ba68 Xia Jiang       2020-08-14  1543  	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
84bb4d04eb7ba68 Xia Jiang       2020-08-14  1544  	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
bd627ff5d585073 Xia Jiang       2020-08-14  1545  	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
b2f0d2724ba477d Rick Chang      2016-12-14  1546  
b2f0d2724ba477d Rick Chang      2016-12-14  1547  	q = &ctx->cap_q;
b4a82f5d15102ad Xia Jiang       2020-08-14  1548  	q->fmt = mtk_jpeg_find_format(jpeg->variant->formats,
b4a82f5d15102ad Xia Jiang       2020-08-14  1549  				      jpeg->variant->num_formats,
b4a82f5d15102ad Xia Jiang       2020-08-14  1550  				      jpeg->variant->cap_q_default_fourcc,
2ac8015f156b55c Xia Jiang       2020-08-14  1551  				      MTK_JPEG_FMT_FLAG_CAPTURE);
0b90056a39ed232 Xia Jiang       2020-08-14  1552  	q->pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
0b90056a39ed232 Xia Jiang       2020-08-14  1553  	q->pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_601;
0b90056a39ed232 Xia Jiang       2020-08-14  1554  	q->pix_mp.quantization = V4L2_QUANTIZATION_FULL_RANGE;
0b90056a39ed232 Xia Jiang       2020-08-14  1555  	q->pix_mp.xfer_func = V4L2_XFER_FUNC_SRGB;
84bb4d04eb7ba68 Xia Jiang       2020-08-14  1556  	q->pix_mp.width = MTK_JPEG_MIN_WIDTH;
84bb4d04eb7ba68 Xia Jiang       2020-08-14  1557  	q->pix_mp.height = MTK_JPEG_MIN_HEIGHT;
b2f0d2724ba477d Rick Chang      2016-12-14  1558  
bd627ff5d585073 Xia Jiang       2020-08-14  1559  	mtk_jpeg_try_fmt_mplane(&q->pix_mp, q->fmt);
b2f0d2724ba477d Rick Chang      2016-12-14  1560  }
b2f0d2724ba477d Rick Chang      2016-12-14  1561  
b2f0d2724ba477d Rick Chang      2016-12-14  1562  static int mtk_jpeg_open(struct file *file)
b2f0d2724ba477d Rick Chang      2016-12-14  1563  {
b2f0d2724ba477d Rick Chang      2016-12-14  1564  	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
b2f0d2724ba477d Rick Chang      2016-12-14  1565  	struct video_device *vfd = video_devdata(file);
b2f0d2724ba477d Rick Chang      2016-12-14  1566  	struct mtk_jpeg_ctx *ctx;
b2f0d2724ba477d Rick Chang      2016-12-14  1567  	int ret = 0;
b2f0d2724ba477d Rick Chang      2016-12-14  1568  
b2f0d2724ba477d Rick Chang      2016-12-14  1569  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
b2f0d2724ba477d Rick Chang      2016-12-14  1570  	if (!ctx)
b2f0d2724ba477d Rick Chang      2016-12-14  1571  		return -ENOMEM;
b2f0d2724ba477d Rick Chang      2016-12-14  1572  
b2f0d2724ba477d Rick Chang      2016-12-14  1573  	if (mutex_lock_interruptible(&jpeg->lock)) {
b2f0d2724ba477d Rick Chang      2016-12-14  1574  		ret = -ERESTARTSYS;
b2f0d2724ba477d Rick Chang      2016-12-14  1575  		goto free;
b2f0d2724ba477d Rick Chang      2016-12-14  1576  	}
b2f0d2724ba477d Rick Chang      2016-12-14  1577  
62b2948678db9fa kyrie wu        2023-03-10  1578  	INIT_WORK(&ctx->jpeg_work, jpeg->variant->jpeg_worker);
a9aae5ce22891a7 kyrie wu        2022-09-29  1579  	INIT_LIST_HEAD(&ctx->dst_done_queue);
a9aae5ce22891a7 kyrie wu        2022-09-29  1580  	spin_lock_init(&ctx->done_queue_lock);
b2f0d2724ba477d Rick Chang      2016-12-14  1581  	v4l2_fh_init(&ctx->fh, vfd);
b2f0d2724ba477d Rick Chang      2016-12-14  1582  	file->private_data = &ctx->fh;
b2f0d2724ba477d Rick Chang      2016-12-14  1583  	v4l2_fh_add(&ctx->fh);
b2f0d2724ba477d Rick Chang      2016-12-14  1584  
b2f0d2724ba477d Rick Chang      2016-12-14  1585  	ctx->jpeg = jpeg;
b2f0d2724ba477d Rick Chang      2016-12-14  1586  	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
b2f0d2724ba477d Rick Chang      2016-12-14  1587  					    mtk_jpeg_queue_init);
b2f0d2724ba477d Rick Chang      2016-12-14  1588  	if (IS_ERR(ctx->fh.m2m_ctx)) {
b2f0d2724ba477d Rick Chang      2016-12-14  1589  		ret = PTR_ERR(ctx->fh.m2m_ctx);
b2f0d2724ba477d Rick Chang      2016-12-14  1590  		goto error;
b2f0d2724ba477d Rick Chang      2016-12-14  1591  	}
b2f0d2724ba477d Rick Chang      2016-12-14  1592  
45f13a57d813445 Xia Jiang       2020-08-14  1593  	if (jpeg->variant->cap_q_default_fourcc == V4L2_PIX_FMT_JPEG) {
45f13a57d813445 Xia Jiang       2020-08-14  1594  		ret = mtk_jpeg_enc_ctrls_setup(ctx);
45f13a57d813445 Xia Jiang       2020-08-14  1595  		if (ret) {
45f13a57d813445 Xia Jiang       2020-08-14  1596  			v4l2_err(&jpeg->v4l2_dev, "Failed to setup jpeg enc controls\n");
45f13a57d813445 Xia Jiang       2020-08-14  1597  			goto error;
45f13a57d813445 Xia Jiang       2020-08-14  1598  		}
45f13a57d813445 Xia Jiang       2020-08-14  1599  	} else {
45f13a57d813445 Xia Jiang       2020-08-14  1600  		v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 0);
45f13a57d813445 Xia Jiang       2020-08-14  1601  	}
723e62524ddae8a kyrie wu        2022-09-29  1602  
b2f0d2724ba477d Rick Chang      2016-12-14  1603  	mtk_jpeg_set_default_params(ctx);
b2f0d2724ba477d Rick Chang      2016-12-14  1604  	mutex_unlock(&jpeg->lock);
b2f0d2724ba477d Rick Chang      2016-12-14  1605  	return 0;
b2f0d2724ba477d Rick Chang      2016-12-14  1606  
b2f0d2724ba477d Rick Chang      2016-12-14  1607  error:
b2f0d2724ba477d Rick Chang      2016-12-14  1608  	v4l2_fh_del(&ctx->fh);
b2f0d2724ba477d Rick Chang      2016-12-14  1609  	v4l2_fh_exit(&ctx->fh);
b2f0d2724ba477d Rick Chang      2016-12-14  1610  	mutex_unlock(&jpeg->lock);
b2f0d2724ba477d Rick Chang      2016-12-14  1611  free:
b2f0d2724ba477d Rick Chang      2016-12-14  1612  	kfree(ctx);
b2f0d2724ba477d Rick Chang      2016-12-14  1613  	return ret;
b2f0d2724ba477d Rick Chang      2016-12-14  1614  }
b2f0d2724ba477d Rick Chang      2016-12-14  1615  
b2f0d2724ba477d Rick Chang      2016-12-14  1616  static int mtk_jpeg_release(struct file *file)
b2f0d2724ba477d Rick Chang      2016-12-14  1617  {
b2f0d2724ba477d Rick Chang      2016-12-14  1618  	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
b2f0d2724ba477d Rick Chang      2016-12-14  1619  	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(file->private_data);
b2f0d2724ba477d Rick Chang      2016-12-14  1620  
b2f0d2724ba477d Rick Chang      2016-12-14  1621  	mutex_lock(&jpeg->lock);
b2f0d2724ba477d Rick Chang      2016-12-14  1622  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
45f13a57d813445 Xia Jiang       2020-08-14  1623  	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
b2f0d2724ba477d Rick Chang      2016-12-14  1624  	v4l2_fh_del(&ctx->fh);
b2f0d2724ba477d Rick Chang      2016-12-14  1625  	v4l2_fh_exit(&ctx->fh);
b2f0d2724ba477d Rick Chang      2016-12-14  1626  	kfree(ctx);
b2f0d2724ba477d Rick Chang      2016-12-14  1627  	mutex_unlock(&jpeg->lock);
b2f0d2724ba477d Rick Chang      2016-12-14  1628  	return 0;
b2f0d2724ba477d Rick Chang      2016-12-14  1629  }
b2f0d2724ba477d Rick Chang      2016-12-14  1630  
b2f0d2724ba477d Rick Chang      2016-12-14  1631  static const struct v4l2_file_operations mtk_jpeg_fops = {
b2f0d2724ba477d Rick Chang      2016-12-14  1632  	.owner          = THIS_MODULE,
b2f0d2724ba477d Rick Chang      2016-12-14  1633  	.open           = mtk_jpeg_open,
b2f0d2724ba477d Rick Chang      2016-12-14  1634  	.release        = mtk_jpeg_release,
b2f0d2724ba477d Rick Chang      2016-12-14  1635  	.poll           = v4l2_m2m_fop_poll,
b2f0d2724ba477d Rick Chang      2016-12-14  1636  	.unlocked_ioctl = video_ioctl2,
b2f0d2724ba477d Rick Chang      2016-12-14  1637  	.mmap           = v4l2_m2m_fop_mmap,
b2f0d2724ba477d Rick Chang      2016-12-14  1638  };
b2f0d2724ba477d Rick Chang      2016-12-14  1639  
648372a87ceef7d Xia Jiang       2020-08-14 @1640  static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
648372a87ceef7d Xia Jiang       2020-08-14  1641  	{ .id = "jpgdec-smi" },
648372a87ceef7d Xia Jiang       2020-08-14  1642  	{ .id = "jpgdec" },
648372a87ceef7d Xia Jiang       2020-08-14  1643  };
648372a87ceef7d Xia Jiang       2020-08-14  1644  
45f13a57d813445 Xia Jiang       2020-08-14 @1645  static struct clk_bulk_data mtk_jpeg_clocks[] = {
45f13a57d813445 Xia Jiang       2020-08-14  1646  	{ .id = "jpgenc" },
45f13a57d813445 Xia Jiang       2020-08-14  1647  };
45f13a57d813445 Xia Jiang       2020-08-14  1648  

:::::: The code at line 1645 was first introduced by commit
:::::: 45f13a57d8134459f02fbee0b1711eddc3260af7 media: platform: Add jpeg enc feature

:::::: TO: Xia Jiang <xia.jiang@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
